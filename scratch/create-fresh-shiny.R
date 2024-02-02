library(fresh)

create_theme(
  
  theme = "default",
  
  # global settings 
  bs_vars_global(
    
    body_bg = "orange", # the body background
    text = "white",
    link_color = "limegreen"
    
  ),
  
  bs_vars_navbar(
    
    default_bg = "maroon",
    default_color = "gray"
    
  ),
  
  bs_vars_tabs(
    
    border_color = "purple"
    
  ),
  
  # filepath where to put output file
  output_file = "../two_file_app/www/shiny-fresh-theme.css"
  
)

