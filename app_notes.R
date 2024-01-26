# Single file vs Two-file app 

# - get lengthy so using the tw-file app might be more helpful 


# ----------------------------------------------------------------------------------------------------
#                       Step 1: Create app folder ----
# ----------------------------------------------------------------------------------------------------
#   
#   For inside the SINGLE APP folder: create folder `app.R`
#
#   For inside the TWO-FILE app folder: create folder `ui.R`, `server.R`, `global.R`
#
#
# ----------------------------------------------------------------------------------------------------
#                       Step 2: Write single-file app ----
# ----------------------------------------------------------------------------------------------------
#       
#       Goals:
#         - adding and styling text in UI using tags
#         - practicing data wrangling and visualization outside of shiny app
#         - follow general workflow for building reactive apps (adding inputs, outputs) 
#         - writing server instructions on how to assemble user input values
#
# Start in ui
# 
# - use {tags} to specify how text should be aligned
# - can next tags
# - look up shiny widgets on google
#
# ----------------------------------------------------------------------------------------------------
#                       Ste 3: Creating Reactive outputs ----
# ----------------------------------------------------------------------------------------------------
#
# In UI...
#
# - all input arguments have the same first argument: inputId
# - unique name that connects UI and server (*hint: label inputs as _input and outputs as _output)
# - second function have parameter label: human readable label for control and appear in the UI
# - look at documentation for what to provide inputs
#
#
# - create plot outputId
#
#
# Go to server
#
# - inputs are what you want the user to interact with
# - outputs are what the user sees
#
#   Rules 
#     1. Save objects you want to display to output$<id>

#     2. Build reactive objects using a render*() function 

#         - choose the right render function for corresponding output function)

#         - Hint: create plots in scratch folder so that there is less mess

#     3. Access input values with input$<id>

#         - in server we gave instructions using reactive() and renderPlot()


# ----------------------------------------------------------------------------------------------------
#                       Step 4: Write two-file app ----
# ----------------------------------------------------------------------------------------------------
#
#   global.R rile for organization
#     - loading packages; importing ddata; sourcing scripts; building ggplot themes
#     - MUST BE saved to the same directory/folder as server.R and ui.R files
#
#
#   Layout functions 
#     - start with CONTAINER function; then add nested things
#     - sidebar, nav bar, panels
#
#
# ----------------------------------------------------------------------------------------------------
#                       Step 5: Adding text to landing page  
# ----------------------------------------------------------------------------------------------------
#
#
#
#