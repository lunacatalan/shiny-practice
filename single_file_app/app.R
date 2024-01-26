# load the packages ----
library(shiny)
library(palmerpenguins)
library(tidyverse)
library(DT)

# define user interface ---

ui <- fluidPage( # establish page for ui / create foundation for page
  
  # add an app title ----
  tags$h1("Palmer Penguins App"), # apply level 1 header
  
  # add an app subtitle ----
  h4(strong("Exploring Antarctic Penguin Data")), # apply level 4 header and use `strong` to make bold
  
  # body mass slider input ----
  sliderInput(inputId = "body_mass_input",
              label = "Select a range of body masses (g):",
              min = 2700,
              max = 6300,
              value = c(3000, 4000)), # initial starting values that the app will begin
  
  # body mass plot output ----
  plotOutput(outputId = "bodyMass_scatterplot_output"),
  
  # DT table input ----
  checkboxGroupInput(inputId = "dt_year_input",
                     label = "Select year(s) of interest:",
                     choices = c(2007, 2008, 2009), # give choices that user can select
                     selected = c(2007, 2008) # default selection
  ),
  
  # DT table output ----
  DT::dataTableOutput(outputId = "dt_year_output")
  
)  

# server ----
# instructions for rendering outputs in here (format for each layer: output$id_output)

server <- function(input, output) {
  
  # filter body masses ----
  body_mass_df <- reactive({ # tell shiny to built reactive df
    
    penguins %>% 
      filter(body_mass_g %in% c(input$body_mass_input[1]:input$body_mass_input[2])) # because we have two sliders that we specified in sliderInput above
    
  })
  
  # render penguin scatter plot ----
  output$bodyMass_scatterplot_output <- renderPlot({ # code to generate plot
    
    # add ggplot code here; instructions for building plot 
    ggplot(na.omit(body_mass_df()), # follow any reactive df with a set of ()
           aes(x = flipper_length_mm, y = bill_length_mm,
               color = species, shape = species)) +
      geom_point() +
      scale_color_manual(values = c("Adelie" = "darkorange", 
                                    "Chinstrap" = "purple", 
                                    "Gentoo" = "cyan4")) +
      scale_shape_manual(values = c("Adelie" = 19, 
                                    "Chinstrap" = 17, 
                                    "Gentoo" = 15)) + 
      labs(x = "Flipper Length (mm)",
           y = "Bill Length (mm)",
           color = "Penguin Species",
           shape = "Penguin Species") +
      theme_minimal() +
      theme(legend.position = c(0.85, 0.2), # change legend position
            legend.background = element_rect(color = "white")
      )
    
    
  }) 
  
  # render dt for selecting years; can also separate filtering steps and use reactive()
  output$dt_year_output <- renderDataTable({
    
    DT::datatable(penguins %>% 
                    filter(year %in% c(input$dt_year_input)))
  })
  
}

# combine UI and Server into app ----
shinyApp(ui = ui, 
         server = server)
