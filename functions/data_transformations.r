library(httr)
library(jsonlite)
library(ggplot2)
library(DescTools)
library(tidyverse)
library(magrittr)
library(rlang)
library(lubridate)
library(anytime)


transform_metadata_to_df <- function(stations_metadata) {
  stations_metadata[[1]] %>%
    map_dfr(as_tibble) %>%
    mutate(
      latestData =
        map_chr(latestData, 1, .default = NA_character_),
      latestData =
        as_datetime(latestData, tz = "UTC")
    )  %>%
    mutate(
      lat = map_dbl(location,
                    ~ .$latLon$lat),
      lon = map_dbl(location,
                    ~ .$latLon$lon))%>% 
        select( -location)
    
  }


# writting function of 4a
#to_iso8601 <- function(time, days_offset){
 # iso8601(time + days_offset) %>%
  #  paste0("Z")
#}

#writting function of 4a



#to test above function
#to_iso8601(as_datetime("2016-09-01 10:11:12"),0)

#to_iso8601(as_datetime("2016-09-01 10:11:12"),-4)