# shiny-practice
Practicing making shiny apps
Using the `shiny` library

## Creating a Dashboard 
Using the `shinydashboard` library

Step 1: make `global.R`, `server.R` and `ui.R` file
- `global.R`: load libraries
- `server.R`: set up server function with input and output calls
- `ui.R`: define header, sidebar, and body for dashboard

Step 2: re-process raw data before adding it to the app folder
- Store raw data in `raw_data` in the root directory
- Process data and save it to the `data` folder in the `shinydashboard` folder

Note
- could save processed files as `.rds` but there are tradeoffs
- it is smaller to save, but it cannot be opened wihtout R


Step 3: Filtering and adding information to map
- do this in a `scratch` .R file


Step 4: Add framework / structure information to the `ui.R`
- sidebar and header details 
- using `fluidRow()` and `box()` to add elemetns to the pages

Step 5: Add processed data to `global.R`
- the data filepath has to be relative to where global.R file is (not the root directory)


Step 6: add inputs and output IDs to `ui.R`

Step 7: Use ID's to `server.R`
- add output$output_IDs with defined code

Step 8: add `text` folder in `shinydashboard` and add long text there
- include `markdown` to load `.md` files 

Step 9: add `www` folder to store any images and things like that 
- provide filepath (note: begins inside www so only need to start filepath there)
