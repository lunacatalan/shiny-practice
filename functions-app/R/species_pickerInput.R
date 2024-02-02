
# name function the same as filename

species_pickerInput <- function(inputId) {
  
  pickerInput(inputId = inputId, label = "Select a species:",
              choices = c("Adelie", "Chinstrap", "Gentoo"),
              selected = c("Adelie", "Chinstrap", "Gentoo"),
              options = pickerOptions(actionsBox = TRUE),
              multiple = TRUE)
  
  
}