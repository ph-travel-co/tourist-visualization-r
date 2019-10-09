# source("init.R")

library("rvest")
library("httr")
library("tidyverse")
library("ggplot2")
library("magrittr")
library("sp")
library("maps")
# animation prerequisites
library("gganimate")
library("gifski")
library("png")
library("transformr")

source("utils.R")

passenger <- data.frame()
for (i in 1:9) {
  year <- 2000 + i
  passenger <- bind_rows(
    passenger,
    paste("data/caap/airdata_passenger_movement_200", i, ".csv", sep = "") %>%
      read.csv() %>%
      mutate(year = year)
  )
}
for (i in 10:16) {
  year <- 2000 + i
  passenger <- bind_rows(
    passenger,
    paste("data/caap/airdata_passenger_movement_20", i, ".csv", sep = "") %>%
      read.csv() %>%
      mutate(year = year)
  )
}

# Scrape data from airportsbase.org for coordinates
apcode1 <-
  read_html("http://airportsbase.org/Philippines/all/airports") %>%
  html_nodes("table") %>%
  extract2(2) %>%
  html_table() %>%
  as.data.frame()
apcode234 <- data.frame()
for (i in 1:3) {
  apcode234 <-
    bind_rows(
      apcode234,
      paste(
        "http://airportsbase.org/Philippines/all/airports/page",
        i,
        sep = ""
      ) %>%
        read_html() %>%
        html_nodes("table") %>%
        extract2(2) %>%
        html_table()
    )
}
apcode <- bind_rows(apcode1, apcode234) %>%
  as.data.frame() %>%
  select(Name, ICAO, IATA, Latitude, Longtitude) %>%
  rename(
    airport = Name,
    icao = ICAO,
    iata = IATA,
    latitude = Latitude,
    longitude = Longtitude
  ) %>%
  filter(latitude != "" | longitude != "") %>%
  mutate(airport = str_to_title(airport)) %>%
  mutate(longitude = coord2dec(longitude)) %>%
  mutate(latitude = coord2dec(latitude)) %>%
  mutate(airport = ap_name_recode(airport))

data_passenger <- passenger %>%
  mutate_at(vars(january:total), funs(as.numeric)) %>%
  mutate_if(is.character, as.factor) %>%
  mutate(year = as.factor(year)) %>%
  select(year, region:total) %>%
  mutate(airport = ap_name_recode(airport))


data_passenger$airport %>%
  unique() %>%
  sort() %>%
  intersect(apcode$airport %>% unique() %>% sort()) %>%
  sort()

# Missing/wrong coordinates for Cebu and Davao
apcode$latitude[which(apcode$airport == "Mactan-Cebu")] <-
  coord2dec("10°18′26\"N")
apcode$longitude[which(apcode$airport == "Mactan-Cebu")] <-
  coord2dec("123°58′44\"E")
apcode$latitude[which(apcode$airport == "Davao")] <-
  coord2dec("07°07′31\"N")
apcode$longitude[which(apcode$airport == "Davao")] <-
  coord2dec("125°38′45\"E")
write.csv(apcode, "data/output/airport_code.csv")

# Join passenger data and airport location data
data <- left_join(data_passenger, apcode) %>%
  gather(month, passenger_count, january:total) %>%
  select(year, month, region:longitude, passenger_count) %>%
  mutate(
    year = year %>% as.character() %>% as.integer(),
    month = as.factor(month),
    passenger_count = as.numeric(passenger_count)
  ) %>%
  mutate(month = fct_relevel(
    month,
    c(
      "january",
      "february",
      "march",
      "april",
      "may",
      "june",
      "july",
      "august",
      "september",
      "october",
      "november",
      "december"
    )
  ))

# Data for Country origin tourists
ctry_arrivals <- data.frame()
for (i in 4:8) {
  ctry_arrivals <- bind_rows(
    ctry_arrivals,
    paste(
      "data/country_origin/Arrivals201",
      i,
      "_formatted.csv",
      sep = ""
    ) %>%
      read.csv(stringsAsFactors = FALSE) %>%
      rename(
        january = JAN,
        february = FEB,
        march = MAR,
        april = APR,
        may = MAY,
        june = JUN,
        july = JUL,
        august = AUG,
        september = SEP,
        october = OCT,
        november = NOV,
        december = DEC
      ) %>%
      mutate(year = 2010 + i) %>%
      mutate(
        region = recode(
          region,
          `A F R I C A` = "Africa",
          `A M E R I C A` = "America",
          `A S I A` = "Asia",
          `AUSTRALASIA/PACIFIC` = "Australasia & The Pacific",
          `E U R O P E` = "Europe",
          `OTHERS & UNSPECIFIED` = "Others & Unspecified",
          `T O T A L` = "Total"
        ) %>%
          str_replace_all("\\*", "") %>%,
        subregion = str_to_title(as.character(subregion)) %>%
          str_replace_all("\\*", "") %>%
          recode(
            `A F R I C A` = "Africa",
            `Asean` = "ASEAN",
            `Australasia/Pacific` = "Australasia & The Pacific",
            `T O T A L` = "Total"
                 ),
        country = str_to_title(as.character(country))
      ) %>%
      mutate_at(
        .vars = vars(january:december),
        .funs = function(var) {
          nocomma <- str_replace_all(var, "\\,", "") %>%
            as.numeric()
          return(nocomma)
        }
      ) %>%
      mutate_if(
        is.character, as.factor
      )
  )
}


# Quickly visualize the data
ggplot(
  data_passenger %>%
    group_by(year, region) %>%
    summarize(total = sum(total)),
  aes(year, total, group = region)
) +
  geom_line(aes(color = region))

ggplot(
  data %>%
    filter(month != "total") %>%
    group_by(month, region) %>%
    summarize(passenger_count = sum(passenger_count, na.rm = TRUE)),
  aes(month, passenger_count, group = region)
) +
  geom_area(aes(fill = region), size = 1)

ggplot(
  data %>%
    group_by(year, region) %>%
    summarize(passenger_count = sum(passenger_count, na.rm = TRUE)),
  aes(year, passenger_count)
) +
  geom_area(aes(fill = region), size = 1)

# Generate PH map
ph_map <- map_data("world") %>% filter(region == "Philippines")
ph_cities_data <-
  world.cities %>% filter(country.etc == "Philippines")

ph <- ggplot(data) +
  geom_polygon(
    data = ph_map,
    aes(x = long, y = lat, group = group),
    fill = "grey",
    alpha = 0.3
  ) +
  geom_point(
    # %>%
    #   # filter(year == 2010 & month == "total") %>%
    #   group_by(year, month, region, airport) %>%
    #   summarize(
    #     passenger_count = mean(passenger_count, na.rm = TRUE),
    #     longitude = mean(longitude, na.rm = TRUE),
    #     latitude = mean(latitude, na.rm = TRUE),
    #     airport = airport
    #   ),
    mapping = aes(
      x = longitude,
      y = latitude,
      color = region,
      size = passenger_count
    ),
    alpha = 0.25
  ) +
  geom_text(
    data %>%
      group_by(airport, longitude, latitude) %>%
      summarize(),
    mapping = aes(x = longitude,
                  y = latitude,
                  label = airport),
    size = 3
  ) +
  scale_size(range = c(1, 25)) +
  theme_minimal()

ph

# ph + transition_time(year) +
#   labs(title = "Year: {frame_time}")
