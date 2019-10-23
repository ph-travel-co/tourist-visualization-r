

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

data %>% summary
data_passenger %>% summary
data_local_yearly %>% summary
data_local %>% summary

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
data_local <- left_join(data_passenger, apcode) %>%
  gather(month, passenger_count, january:total) %>%
  select(year, month, region:longitude, passenger_count) %>%
  mutate(
    year = year %>% as.character() %>% as.integer(),
    month = as.factor(month),
    passenger_count = as.numeric(passenger_count)
  ) %>%
  mutate(month = fct_relevel_month(month))

data_local_yearly <- data_local %>%
  group_by(year, region, airport) %>%
  summarize(passenger_count = sum(passenger_count, na.rm = TRUE),
            longitude = mean(longitude, na.rm = TRUE),
            latitude = mean(latitude, na.rm = TRUE))

write.csv(data_local, "data/output/data_local.csv", row.names = FALSE)
write.csv(data_local_yearly,
          "data/output/data_local_yearly.csv",
          row.names = FALSE)

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
      mutate(year = 2010 + i %>% as.integer) %>%
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
          as.character %>%
          str_replace_all("\\*", ""),
        subregion = as.character(subregion) %>%
          str_to_title() %>%
          recode(
            `A F R I C A` = "Africa",
            `Asean` = "ASEAN",
            `Australasia/Pacific` = "Australasia & The Pacific",
            `T O T A L` = "Total"
          ) %>%
          str_replace_all("\\*", ""),
        country = as.character(country) %>%
          str_to_title() %>%
          recode(
            `Independent States` = "Commonwealth Of Independent States",
            `T O T A L` = "Total",
            `Usa` = "USA"
          ) %>%
          str_replace_all("\\*", "") %>%
          as.factor
      ) %>%
      mutate_at(
        .vars = vars(january:december),
        .funs = function(var) {
          nocomma <- str_replace_all(var, "\\,", "") %>%
            as.numeric()
          return(nocomma)
        }
      ) %>%
      select(region:country, year, january:december) %>%
      gather(month, passenger_count, january:december) %>%
      mutate(month = fct_relevel_month(month)) %>%
      mutate_if(is.character, as.factor)
  )
}
ctry_arrivals$country <- ctry_arrivals$country %>% as.factor


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

ph_passenger <- ggplot(data_local_yearly %>% filter(year == 2016)) +
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
    alpha = 0.45
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
  scale_size(range = c(1, 50)) +
  theme_minimal()

ph_passenger

# ph + transition_time(year) +
#   labs(title = "Year: {frame_time}")

# Visualize Wourld Map Country of Origin of Tourists to the Philippines
# world_map <- map_data("world2")
world_map
world_ctry_cntr <- world.cities %>%
  rename(country = country.etc) %>%
  group_by(country) %>%
  summarize(ctry_cntr_lat = mean(lat),
            ctry_cntr_long = mean(long) %>% remap_long()) %>%
  ungroup() %>%
  mutate(
    country = recode(
      country,
      `UK` = "United Kingdom",
      `Russia` = "Russian Federation",
      `Korea South` = "Korea"
    )
  )

ctry_arrivals$country[!(ctry_arrivals$country %in% world_ctry_cntr$country)] %>% unique
ctry_arrivals$country %>% unique %>% sort
world_ctry_cntr$country %>% unique %>% sort

data_world <- left_join(ctry_arrivals, world_ctry_cntr) %>%
  group_by(year, month, region, subregion, country) %>%
  summarize(
    passenger_count = sum(passenger_count, na.rm = TRUE),
    ctry_cntr_long = mean(ctry_cntr_long, na.rm = TRUE),
    ctry_cntr_lat = mean(ctry_cntr_lat, na.rm = TRUE)
  ) %>%
  ungroup() %>%
  filter(country != "Total")
# filter(year == max(year))

data_world_yearly <- data_world %>%
  spread(year, passenger_count) %>%
  rename(
    y2014 = `2014`,
    y2015 = `2015`,
    y2016 = `2016`,
    y2017 = `2017`,
    y2018 = `2018`
  ) %>%
  filter(region != "Total")

data_world_yearly_sum <- data_world_yearly %>%
  gather(year, tourist_count, y2014:y2018) %>%
  group_by(year, region, subregion, country) %>%
  summarize(tourist_count = sum(tourist_count, na.rm = T)) %>%
  ungroup %>%
  mutate(year = str_replace_all(year, "y", "") %>% as.integer)

data_world_yearmonth <- data_world %>%
  mutate(month = mnth2num(month) %>% as.character()) %>%
  mutate(year = year %>% as.character()) %>%
  unite(col = date, year, month, sep = "") %>%
  mutate(date = date %>% paste("01", sep = "") %>% ymd) %>%
  # Not enough data for below dates
  filter(date != "2014-03-01" %>% ymd) %>%
  filter(date != "2015-01-01" %>% ymd) %>%
  filter(date != "2015-04-01" %>% ymd) %>%
  filter(date != "2017-11-01" %>% ymd) %>%
  filter(date != "2017-12-01" %>% ymd) %>%
  filter(date != "2018-03-01" %>% ymd)

data_world_top20 <- data_world_yearmonth %>%
  filter(country != "Residences") %>%
  group_by(region, subregion, country) %>%
  summarize(passenger_count = sum(passenger_count, na.rm = TRUE)) %>%
  ungroup() %>%
  top_n(20, passenger_count) %>%
  arrange(passenger_count %>% desc) %>%
  select(country) %>%
  left_join(data_world_yearmonth, by="country") %>%
  filter(date == ymd("2018-12-01")) %>%
  arrange(passenger_count %>% desc) %>%
  select(country)

data_world_top10_restworld <- data_world_yearmonth %>%
  anti_join(data_world_top10, by="country") %>%
  group_by(date, region, subregion) %>%
  summarize(passenger_count = sum(passenger_count, na.rm = TRUE)) %>%
  bind_rows(
    left_join(data_world_top10, data_world_yearmonth, by="country") %>%
      select(-subregion) %>%
      rename(subregion = country)
  ) %>%
  arrange(desc(passenger_count))

# Test
# data_world_yearmonth %>% filter(date == "2018-03-01" %>% ymd)

write.csv(data_world, "data/output/data_world.csv", row.names = FALSE)
write.csv(data_world_yearly,
          "data/output/data_world_yearly.csv",
          row.names = FALSE)
write.csv(data_world_yearmonth,
          "data/output/data_world_yearmonth.csv",
          row.names = FALSE)
write.csv(data_world_top20,
          "data/output/data_world_top20.csv",
          row.names = FALSE)
write.csv(data_world_top10_restworld,
          "data/output/data_world_top10_restworld.csv",
          row.names = FALSE)

# Visualize
world <- ggplot(data_world %>%
                  filter(year == 2018) %>%
                  group_by(region, subregion, country) %>%
                  summarize(passenger_count = sum(passenger_count, na.rm = TRUE),
                            ctry_cntr_long = mean(ctry_cntr_long, na.rm = TRUE),
                            ctry_cntr_lat = mean(ctry_cntr_lat, na.rm = TRUE))) +
  geom_polygon(
    data = world_map,
    aes(x = long.new, y = lat, group = gr.split),
    fill = "grey",
    alpha = 0.3
  ) +
  geom_point(
    mapping = aes(
      x = ctry_cntr_long,
      y = ctry_cntr_lat,
      color = region,
      size = passenger_count
    ),
    alpha = 0.35,
    show.legend = FALSE
  ) +
  geom_curve(
    mapping = aes(
      x = ctry_cntr_long,
      y = ctry_cntr_lat,
      # PH coordinates based on Manila
      xend = 120.984222 + shift - 360,
      yend = 14.599512
      ), 
    alpha = 0.15
  ) +
  geom_text(
    mapping = aes(x = ctry_cntr_long,
                  y = ctry_cntr_lat,
                  label = country),
    size = 3
  ) +
  scale_size(range = c(1, 50)) +
  theme_minimal()

world

# world + transition_time(year) +
#   labs(title = "Year: {frame_time}")

ggplot(data_world_yearmonth) +
  geom_area(position = "stack", stat = "bin", binwidth = 35, aes(date, weight = passenger_count, fill = subregion, group = subregion)) +
  facet_grid(region ~ .)

ggplot(data_world_yearly_sum %>%
         group_by(country) %>%
         top_n(10, tourist_count) %>%
         ungroup %>%
         arrange(country, year)) +
  geom_line(aes(year, tourist_count, color = region, group = country))

ggplot(data_world_yearly_sum) +
  geom_area(position = "stack", stat = "bin", binwidth = 1, aes(year, weight = tourist_count, fill = region, group = region))
