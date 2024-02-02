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
  
  #tabItems -----
  tabItems(
    
    #welcome tabItem ----
    tabItem(tabName = "welcome",
            
            # left-hand column -----
            column(width = 6,
                   
                   # background info box ----
                   box(width = NULL,
                       
                       "background info here"
                       
                       ) # END background box
                   
                   ), # END left column 
            
            # right-hand column -----
            column(width = 6,
                   
                   # citation fluidRow ----
                   fluidRow(
                     
                     # citation box ----
                     box(width = NULL,
                         
                         "citations go here"
                         
                     ) # END citation box
                     
                   ), # END citation row
                   
                   # disclaimer fluidRow ----
                   fluidRow(
                     
                     # disclaimer box ----
                     box(width = NULL,
                         
                         "dcussion goes here"
                         
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