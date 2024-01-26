# user interface ----
ui <- navbarPage(
  
  # add title
  title = "LTER Animal Data Explorer",
  
  # (Page 1) intro tabPanel ----
  tabPanel(
    
    title = "About this page", # title of the panel
    
    "background information goes here !!!" # this is the text on this panel
    
    
  ), # END (Page1) intro tabPanel
  
  # (Page 2) daata viz tabPanel ----
  tabPanel(
    
    title = "Explore the Data",
    
    # tabsetPanel to contain tabs for data viz ----
    tabsetPanel(
      
      # create trout tabPanel ----
      tabPanel(title = "Trout",
               
               # trout sidebarLayout ----
               sidebarLayout(
                 
                 # trout sidebarPanel ----
                 sidebarPanel(
                   
                   # channel type pickerInput ----
                   pickerInput(inputId = "channel_type_input",
                               label = "Select channel type(s):",
                               choices = unique(clean_trout$channel_type), # make all the channel types appear
                               selected = c("cascade", "pool"),
                               options = pickerOptions(actionsBox = TRUE),
                               multiple = TRUE
                               ),
                   
                   # section checkboxGroupButtons ----
                   checkboxGroupButtons(inputId = "section_input",
                                        label = "Select a sampling section(s):",
                                        choices = c("clear cut forest", "old growth forest"),
                                        selected = c("clear cut forest", "old growth forest"),
                                        individual = FALSE, justified = TRUE, # button location
                                        checkIcon = list(yes = icon("check"), # what it looks like when clicked
                                                         no = icon("xmark")), # from fontawesome.com
                                        size = "sm") # set size small
                   
                 ), # END trout sidebarPanel
                 
                 # trout mainPanel ----
                 mainPanel(
                   
                   # trout scatterplot output ----
                   plotOutput(outputId = "trout_scatterplot_output")
                   
                 ) # END trout mainPanel
                 
               ) # END trout sidebarLayout
               
      ), # END trout tabPanel
      
      # penguin tabPanel ----
      tabPanel(
        
        title = "Penguins",
        
        # penguin sidebarLayout ----
        sidebarLayout(
          
          # penguin sidebarPanel
          sidebarPanel(
            
            # add island picker ----
            pickerInput(inputId = "island_type_input",
                        label = "Select island(s):",
                        choices = c("Biscoe", "Dream", "Torgersen"),
                        selected = unique(penguins$island),
                        options = pickerOptions(actionsBox = TRUE),
                        multiple = TRUE),
            
            # add bin number slider input
            sliderInput(inputId = "bin_num_input",
                        label = "Select number of bins:",
                        value = 25, min = 1, max = 100)
            
          ), # END penguin sidebarPanel
          
          # penguin mainPanel
          mainPanel(
            
            # penguin histogram will go here ----
            plotOutput(outputId = "penguin_histogram_output")
            
          ) # END penguin mainPanel
          
        ) # END penguin sidebarLayout
        
      ) # END penguin tabPanel
      
      
      
    ) # END tabsetPanel
    
    
  ) # END (Page 2) tabPanel
  
  
  
) # END navbar page
