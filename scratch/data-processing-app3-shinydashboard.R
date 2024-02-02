# load packages 
library(tidyverse)

# read in raw data
lake_raw <- read_csv(here::here("raw_data/FCWO_lakemonitoringdata_2011_2022_daily.csv"))

# average depth and temp for each site ------
avg_depth_temp <- lake_raw %>% 
  select(Site, Depth, BedTemperature) %>% 
  filter(Depth != "NaN") %>% # remove character strings "NaN" from depth column
  drop_na(BedTemperature) %>% # drop NA's from bedtemp column
  group_by(Site) %>% 
  summarize(
    AvgDepth = round(mean(Depth), 1),
    AvgTemp = round(mean(BedTemperature), 1)
  )

# join df together -----
join_df <- full_join(lake_raw, avg_depth_temp)

# pull out unique lakes (by Site)
unique_lake <- join_df %>% 
  select(Site, Latitude, Longitude, Elevation, AvgDepth, AvgTemp) %>% 
  distinct() # select only the unique rowa in dataframe

# save processed datainto data folder
write_csv(unique_lake, file = here::here("shinydashboard", "data", "lake_data_processed.csv"))

          