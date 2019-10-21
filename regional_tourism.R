# Municities Coordinates
municities_coord <-
  read.csv("data/raw_csv/municities_coordinates.csv",
           stringsAsFactors = FALSE) %>%
  mutate(region = region_recode(region)) %>%
  # mutate(province = province_recode(province))
  mutate(municity = municity_recode(municity)) %>%
  group_by(region, province, municity) %>%
  summarize(x = mean(x, na.rm = TRUE), y = mean(y, na.rm = TRUE)) %>%
  arrange(region, province, municity)
municities_province <- municities_coord$province %>% unique %>% sort

# Regional tourist Philippine data from Department of Tourism
rt2017_1 <- as_tibble() %>% mutate_all(as.character)
rt2017_2 <- as_tibble() %>% mutate_all(as.character)

for (i in 1:9) {
  rt2017_1 <- bind_rows(
    rt2017_1,
    paste("data/raw_csv/RegionalTravelers2017-0", i, ".csv", sep = "") %>%
      read.csv(stringsAsFactors = FALSE) %>%
      mutate_all(as.character)
  )
}

for (i in 10:12) {
  rt2017_2 <- bind_rows(
    rt2017_2,
    paste("data/raw_csv/RegionalTravelers2017-", i, ".csv", sep = "") %>%
      read.csv(stringsAsFactors = FALSE) %>%
      mutate_all(as.character)
  )
}

reg_tourist_2017 <- bind_rows(rt2017_1, rt2017_2) %>%
  mutate(year = "2017") %>%
  select(year, province:total)


reg_tourist_2014 <-
  read.csv("data/raw_csv/RegionalTravelers2014-converted.csv",
           stringsAsFactors = FALSE) %>%
  mutate(year = "2014") %>%
  mutate_all(as.character) %>%
  as_tibble

reg_tourist_2015 <-
  read.csv("data/raw_csv/RegionalTravelers2015-converted.csv",
           stringsAsFactors = FALSE) %>%
  mutate(year = "2015") %>%
  mutate_all(as.character) %>%
  as_tibble

reg_tourist_2016 <-
  read.csv("data/raw_csv/RegionalTravelers2016-converted.csv",
           stringsAsFactors = FALSE) %>%
  mutate(year = "2016") %>%
  mutate_all(as.character) %>%
  as_tibble

reg_tourist_2018 <-
  read.csv("data/raw_csv/RegionalTravelers2018-converted.csv",
           stringsAsFactors = FALSE) %>%
  mutate(year = "2018") %>%
  mutate_all(as.character) %>%
  as_tibble

reg_tourist <- bind_rows(
  reg_tourist_2014,
  reg_tourist_2015,
  reg_tourist_2016,
  reg_tourist_2017,
  reg_tourist_2018
) %>%
  mutate_at(.vars = c("foreign", "ofw", "domestic", "total"),
            .funs = as.numeric) %>%
  mutate(region = ifelse(str_detect(province, "NCR|CAR|Region|GRAND"), province, NA)) %>%
  rename(municity = province) %>%
  filter(municity != "Manila") %>%
  mutate(municity = recode(municity, `NCR (National Capital Region)` = "Metro Manila")) %>%
  fill(region) %>%
  mutate(region = region_recode(region)) %>%
  filter(!str_detect(municity, "CAR|Region|GRAND")) %>%
  mutate(municity = municity_recode(municity)) %>%
  mutate(province = ifelse(municity %in% municities_province, municity, NA)) %>%
  fill(province) %>%
  mutate(province = replace(
    province,
    region == "NCR (National Capital Region)",
    "Metropolitan Manila"
  )) %>%
  filter(!(municity %in% municities_province)) %>%
  select(year, region, province, municity, foreign:total) %>%
  filter(municity != "Others")

# Exporting coordinates of PH municipalities and cities using QGIS
reg_tourist %>% sample_n(100)
# municities_coord %>% filter(region == "NCR (National Capital Region)")
reg_tourist_ref <- reg_tourist$province %>% unique %>% sort
municities_coord_ref <- municities_coord %>% 
  select(region, province, municity) %>% 
  filter(province %in% reg_tourist_ref) %>% 
  group_by(region, province, municity) %>% 
  summarize(count = n())

municity_mismatch <- left_join(reg_tourist, municities_coord) %>%
  arrange(province) %>%
  filter(is.na(x)) %>%
  group_by(region, province, municity) %>%
  summarize(n())
municity_mismatch %>%
  select(municity, province)
municity_mismatch %>% ungroup %>% mutate_if(is.character, as.factor) %>% summary

reg_tourist_coord <- left_join(reg_tourist, municities_coord) %>%
  arrange(region, province, municity) %>%
  select(-ofw) %>%
  gather(tourist_origin, tourist_count, c("foreign", "domestic", "total")) %>%
  mutate(year = as.integer(year)) %>%
  mutate_if(is.character, as.factor) %>%
  group_by(region, province, municity, tourist_origin) %>%
  ungroup() %>%
  mutate(islandgroup = islandgroup_recode(region))
  
# Most popular locations for tourists
rgt_dom <- reg_tourist_coord %>%
    filter(tourist_origin == "domestic") %>%
    group_by(region, province, municity) %>%
    summarize(tourist_count_accum = sum(tourist_count, na.rm = TRUE)) %>%
    ungroup() %>%
    top_n(100, tourist_count_accum) %>%
    arrange(tourist_count_accum %>% desc) %>%
    as.data.frame %>%
    select(-tourist_count_accum)

rgt_for <- reg_tourist_coord %>%
    filter(tourist_origin == "foreign") %>%
    group_by(region, province, municity) %>%
    summarize(tourist_count_accum = sum(tourist_count, na.rm = TRUE)) %>%
    ungroup() %>%
    top_n(100, tourist_count_accum) %>%
    arrange(tourist_count_accum %>% desc) %>%
    as.data.frame
    select(-tourist_count_accum)

rgt_tot <- reg_tourist_coord %>%
    filter(tourist_origin == "total") %>%
    group_by(region, province, municity) %>%
    summarize(tourist_count_accum = sum(tourist_count, na.rm = TRUE)) %>%
    ungroup() %>%
    top_n(100, tourist_count_accum) %>%
    arrange(tourist_count_accum %>% desc) %>%
    as.data.frame
    select(-tourist_count_accum)

reg_tourist_pop <- bind_rows(rgt_dom, rgt_for, rgt_tot) %>% 
  left_join(reg_tourist_coord)

reg_tourist_pop_coord <- reg_tourist_pop %>%
  group_by(islandgroup, municity, x, y) %>%
  summarize

# # Most locations getting lots of attention or trending recently
# rgt_dom_trend <- reg_tourist_coord %>%
#   filter(tourist_origin == "domestic") %>%
#   group_by(region, province, municity) %>%
#   summarize(delta_perc = (max(tourist_count) - min(tourist_count)) / sum(tourist_count) * 100) %>%
#   ungroup() %>%
#   top_n(10, delta_perc) %>%
#   select(-delta_perc)
# 
# rgt_for_trend <- reg_tourist_coord %>%
#   filter(tourist_origin == "foreign") %>%
#   group_by(region, province, municity) %>%
#   summarize(delta_perc = (max(tourist_count) - min(tourist_count)) / sum(tourist_count) * 100) %>%
#   ungroup() %>%
#   top_n(10, delta_perc) %>%
#   select(-delta_perc)
# 
# rgt_tot_trend <- reg_tourist_coord %>%
#   filter(tourist_origin == "total") %>%
#   group_by(region, province, municity) %>%
#   summarize(delta_perc = (max(tourist_count) - min(tourist_count)) / sum(tourist_count) * 100) %>%
#   ungroup() %>%
#   top_n(10, delta_perc) %>%
#   select(-delta_perc)
# 
# reg_tourist_trend <- bind_rows(rgt_dom_trend, rgt_for_trend, rgt_tot_trend) %>% left_join(reg_tourist_coord)

# Visualize
ph_map <- map_data("world") %>% filter(region == "Philippines")
ph_cities_data <- world.cities %>% filter(country.etc == "Philippines")

ph_tourist <- ggplot(reg_tourist_coord %>% 
                       filter(year == 2018) %>%
                       filter(tourist_origin == "total")) +
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
      x = x,
      y = y,
      color = islandgroup,
      size = tourist_count
    ),
    alpha = 0.35
  ) +
  geom_text(
    data = reg_tourist_pop_coord,
    mapping = aes(
      x = x,
      y = y,
      label = municity
    )
  ) +
  geom_point(
    data = reg_tourist_pop_coord,
    mapping = aes(
      x = x,
      y = y
    ), size = 1, alpha = 0.5
  ) +
  # geom_text(
  #   data %>%
  #     group_by(airport, longitude, latitude) %>%
  #     summarize(),
  #   mapping = aes(x = longitude,
  #                 y = latitude,
  #                 label = airport),
  #   size = 3
  # ) +
  facet_wrap(.~tourist_origin) +
  scale_size(range = c(1, 15)) +
  theme_minimal()
ph_tourist

# Visualizing popular tourist destinations in Philippines
ph_pop_wide <- ggplot(reg_tourist_pop, aes(color = islandgroup, fill = islandgroup, group = municity)) +
  # geom_line(aes(year, tourist_count)) +
  geom_area(stat = "bin", position = "stack", binwidth = 1, aes(year, weight = tourist_count), alpha = 0.35) +
  # geom_point(aes(year, tourist_count)) +
  facet_grid(reorder(municity, -tourist_count) ~ tourist_origin) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  theme_minimal()
ph_pop_wide

ph_pop_wide <- ggplot(reg_tourist_pop, aes(color = tourist_origin, group = tourist_origin)) +
  geom_line(aes(year, tourist_count)) +
  geom_point(aes(year, tourist_count)) +
  facet_wrap(~reorder(municity, -tourist_count), ncol = 5) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  theme_minimal()
ph_pop_wide

ph_pop_mobile <- ggplot(reg_tourist_pop, aes(color = tourist_origin, group = tourist_origin)) +
  geom_line(aes(year, tourist_count)) +
  geom_point(aes(year, tourist_count)) +
  facet_wrap(~reorder(municity, -tourist_count), ncol = 3) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  theme_minimal()
ph_pop_mobile

# # PH tourist destinations gaining attention
# ph_trend <- ggplot(reg_tourist_trend, aes(color = region, group = municity)) +
#   geom_line(aes(year, tourist_count)) +
#   geom_point(aes(year, tourist_count)) +
#   facet_grid(tourist_origin~municity) +
#   theme(axis.text.x = element_text(angle = 90, hjust = 1))
# ph_trend
  
