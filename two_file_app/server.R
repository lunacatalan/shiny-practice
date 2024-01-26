# server 
server <- function(input, output) {
  
  # filter trout data ----
  trout_filtered_df <- reactive({
    
    # gentle error messages with conditions ----
    validate(
      need(length(input$channel_type_input) > 0, # whats being selected by the user
           "Please select at least 1 channel type to visualize data for!"), # if it is 0 or less
      
      need(length(input$section_input) > 0, 
           "Please select at least 1 section (clear cut forest for old growth forest)")
    )
    
    
    clean_trout %>%  
      filter(channel_type %in% c(input$channel_type_input)) %>% # for user input
      filter(section %in% c(input$section_input))
    
  })
  
  # build trout scatterplot ----
  output$trout_scatterplot_output <- renderPlot({
    
    # save ggplot code to render to correct space
    ggplot(trout_filtered_df(), # make sure to add ()
           aes(x = length_mm, y = weight_g, color = channel_type, shape = channel_type)) +
      geom_point(alpha = 0.7, size = 5) +
      scale_color_manual(values = c("cascade" = "#2E2585", "riffle" = "#337538", "isolated pool" = "#DCCD7D", 
                                    "pool" = "#5DA899", "rapid" = "#C16A77", "step (small falls)" = "#9F4A96", 
                                    "side channel" = "#94CBEC")) +
      scale_shape_manual(values = c("cascade" = 15, "riffle" = 17, "isolated pool" = 19, 
                                    "pool" = 18, "rapid" = 8, "step (small falls)" = 23, 
                                    "side channel" = 25)) +
      labs(x = "Trout Length (mm)", y = "Trout Weight (g)", color = "Channel Type", shape = "Channel Type") +
      myCustomTheme() # add custom theme
    
  })
  
  # filter penguin data 
  island_df <- reactive({
    
    penguins %>%
      filter(island %in% c(input$island_type_input))
  })
  
  # build penguin histogram
  output$penguin_histogram_output <- renderPlot({
    
    # histogram code
    ggplot(na.omit(island_df()), # make sure to add ()
           aes(x = flipper_length_mm, fill = species)) +
      geom_histogram(alpha = 0.6, position = "identity", 
                     bins = input$bin_num_input) +
      scale_fill_manual(values = c("Adelie" = "#FEA346", "Chinstrap" = "#B251F1", "Gentoo" = "#4BA4A4")) +
      labs(x = "Flipper length (mm)", y = "Frequency",
           fill = "Penguin species") +
      myCustomTheme()
    
    
  })
  
}
