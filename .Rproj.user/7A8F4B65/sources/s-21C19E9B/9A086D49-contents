library("tidyverse")
library("ggplot2")

read.csv("data/caap/airdata_passenger_movement_2001.csv")
  
passenger <- data.frame()

for (i in 1:9){
  year <- 2000 + i
  passenger <- bind_rows(passenger,
    paste("data/caap/airdata_passenger_movement_200", i, ".csv", sep="") %>%
    read.csv() %>%
      mutate(year = year))
}

for (i in 10:16){
  year <- 2000 + i
  passenger <- bind_rows(passenger,
  paste("data/caap/airdata_passenger_movement_20", i, ".csv", sep="") %>%
    read.csv() %>%
    mutate(year = year))
}

data_passenger <- passenger %>%
  mutate_at(vars(january:total), funs(as.numeric)) %>%
  mutate_if(is.character, as.factor) %>%
  mutate(year = as.factor(year)) %>%
  summary()


# Quickly visualize the data

ggplot(data_passenger, aes()) +
  geom_point()