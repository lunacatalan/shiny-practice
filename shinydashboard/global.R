# load packages ----
library(shiny)
library(shinydashboard)

# load anything required for dats analysis
library(tidyverse)
library(leaflet)
library(shinycssloaders)
library(markdown)

# read in processed here -----
# filepath relative to where global.R file is 
lake_data <- read_csv("data/lake_data_processed.csv")
