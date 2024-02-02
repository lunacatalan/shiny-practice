server <- function(input, output) {
  
  # filter lake data -----
  filtered_lakes_df <- reactive({
    
    lake_data %>% 
      filter(Elevation >= input$elevation_slider_input[1] & Elevation <= input$elevation_slider_input[2]) %>% 
      filter(AvgTemp >= input$bedtemp_slider_input[1] & AvgTemp <= input$bedtemp_slider_input[2]) %>% 
      filter(AvgDepth >= input$depth_slider_input[1] & AvgDepth <= input$depth_slider_input[2])
    
  })
  
  # building map iwth outputID-----
  output$lake_map_output <- renderLeaflet({
    
    leaflet() %>% 
      addProviderTiles(providers$Esri.WorldImagery) %>%  # select background
      setView(lng = -152.05, # set starting view
              lat = 70.25,
              zoom = 6) %>% 
      addMiniMap(toggleDisplay = T, # can move around
                 minimized = F) %>% 
      addMarkers(data = filtered_lakes_df(),
                 lng = filtered_lakes_df()$Longitude,
                 lat = filtered_lakes_df()$Latitude,
                 popup = paste0(
                   
                   "Site Name: ", filtered_lakes_df()$Site, "<br>", # html to make a break between lines
                   "Elevation: ", filtered_lakes_df()$Elevation, " meters (above Sea Level)", "<br>",
                   "Avg Depth: ", filtered_lakes_df()$AvgDepth, " meters", "<br>",
                   "Avg Lakebed Temp: ", filtered_lakes_df()$AvgTemp, "\u00B0C" # u00B0 encodes a special character
                   
                 ))
    
  })
  
}