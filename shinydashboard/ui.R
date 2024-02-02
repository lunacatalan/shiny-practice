# dashboard header ------------------------------
header <- dashboardHeader(
  
  # title -----
  title = "Fish Creek Watershed Lake Monitoring",
  titleWidth = 400 # change width of the title 
  
  
)



# dashboard sidebar ------------------------------
sidebar <- dashboardSidebar(
  
  
  # sidebar ----
  sidebarMenu(
    
    menuItem(text = "Welcome", 
             tabName = "welcome", # unique identifier to refer
             icon = icon("star")),
    menuItem(text = "Dashboard", 
             tabName = "dashboard",
             icon = icon("gauge"))
    
    
  ) # END sidebarMenu
)




# dashboard body ------------------------------
body <- dashboardBody(
  
  # set theme ----
  fresh::use_theme("dashboard-fresh-theme.css"),
  
  #tabItems -----
  tabItems(
    
    #welcome tabItem ----
    tabItem(tabName = "welcome",
            
            # left-hand column -----
            column(width = 6,
                   
                   # background info box ----
                   box(width = NULL,
                       
                       title = tagList(icon("water"), 
                                       strong("Monitoring Fish Creek Watershed")),
                       includeMarkdown("text/intro.md"), # add text 
                       tags$img(src = "FishCreekWatershedSiteMap_2020.jpg", # filepath to image
                                alt = "Map of Northern AK, showing Fish Creen Watershed, located within the North.",
                                style = "max-width: 100%;"), # scale size to 100% of size within contain 
                       tags$h6(tags$em("Map Source:", 
                                       tags$a(href = "http://www.fishcreekwatershed.org/", # hyperlink
                                              "FCWO")),
                               style = "text-align: center;") # centers the map source text
                       
                       ) # END background box
                   
                   ), # END left column 
            
            # right-hand column -----
            column(width = 6,
                   
                   # citation fluidRow ----
                   fluidRow(
                     
                     # citation box ----
                     box(width = NULL,
                         
                         title = tagList(strong("Citations")),
                         includeMarkdown("text/citation.md")
                         
                     ) # END citation box
                     
                   ), # END citation row
                   
                   # disclaimer fluidRow ----
                   fluidRow(
                     
                     # disclaimer box ----
                     box(width = NULL,
                         
                         title = tagList(icon("warning"),
                                         strong("Disclaimer")), 
                         includeMarkdown("text/disclaimer.md")
                         
                     ) # END disclaimer box
                     
                   ) # END disclaimer row
                   
            ) # END right column  
            
    ), # END welcome tabItem
    
    #dashboard
    tabItem(tabName = "dashboard",
            
            # fluidRow (defines region) ----
            fluidRow(
              
              # input box (contain sliders) ----
              box(width = 4,
                  
                 # add title to slider
                 title = tags$strong("Adjust lake parameter ranges:"), # strong tag for bolding
                 
                 # sliderInputs ----
                 sliderInput(inputId = "elevation_slider_input",
                             label = "Elevation (meters about Sea Level):",
                             min = min(lake_data$Elevation),
                             max = max(lake_data$Elevation),
                             value = c(min(lake_data$Elevation), max(lake_data$Elevation)) # where slider will start
                             
                 ), # END sliderInput for elevation
                 
                 sliderInput(inputId = "bedtemp_slider_input",
                             label = "Average Bed Temperature (ºC):",
                             min = min(lake_data$AvgTemp),
                             max = max(lake_data$AvgTemp),
                             value = c(min(lake_data$AvgTemp), max(lake_data$AvgTemp))
                             
                 ), # END sliderInput for temperature
                 
                 sliderInput(inputId = "depth_slider_input",
                             label = "Average Depth (meters):",
                             min = min(lake_data$AvgDepth),
                             max = max(lake_data$AvgDepth),
                             value = c(min(lake_data$AvgDepth), max(lake_data$AvgDepth))
                             
                 ) # END sliderInput for depth
                 
                 
              ), # END input box
              
              # map box
              box(width = 8,
                  
                  title = strong("Monitoring lakes within Fish Creek Watershed:"),
                  
                  # leaflet output -----
                  leafletOutput(outputId = "lake_map_output") %>% 
                    withSpinner(type = 4, color = "midnightblue")
                  
                  ) # END map box
              
            ) # END fluidRow
            
    ) #END dashbaord
    
  ) # END tabItems
  
)


# combine all into a dashboard page ---------
dashboardPage(
  
  header, 
  sidebar, 
  body
)