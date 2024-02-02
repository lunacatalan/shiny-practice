# load packages ------
library(tidyverse)
library(leaflet)

# read in the processed data ------
lake_data <- read_csv(here::here("shinydashboard", "data", "lake_data_processed.csv"))


# practice filtering -------
filtered_lakes <- lake_data %>% 
  filter(Elevation >= 8 & Elevation <= 20) %>% 
  filter(AvgDepth >= 2 & AvgDepth <= 3) %>% 
  filter(AvgTemp >= 4 & AvgTemp <= 6)

# build leaflet map -----

leaflet() %>% 
  addProviderTiles(providers$Esri.WorldImagery) %>%  # select background
  setView(lng = -152.05, # set starting view
          lat = 70.25,
          zoom = 6) %>% 
  addMiniMap(toggleDisplay = T, # can move around
             minimized = F) %>% 
  addMarkers(data = filtered_lakes,
             lng = filtered_lakes$Longitude,
             lat = filtered_lakes$Latitude,
             popup = paste0(
               
               "Site Name: ", filtered_lakes$Site, "<br>", # html to make a break between lines
               "Elevation: ", filtered_lakes$Elevation, " meters (above Sea Level)", "<br>",
               "Avg Depth: ", filtered_lakes$AvgDepth, " meters", "<br>",
               "Avg Lakebed Temp: ", filtered_lakes$AvgTemp, "\u00B0C" # u00B0 encodes a special character; or option 0
               
             ))
  




