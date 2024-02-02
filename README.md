# shiny-practice
Practicing making shiny apps
Using the `shiny` library

# Creating a Dashboard 

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

# Themeing and Styling 

## Libraries: 
`bslib`

- based on Bootstrap; real time themeing 

- plays well with `thematic`

- can make shiny app similar to shinydashboard

- doesn't work with shinydashboard 

### In Single-File Shiny App

Within the `app.R` file, go to the `ui` object and within `fluiPage()` we can add a `theme = bs_theme()` and add a theme. 

- Can set preloaded themes or specify background colors and fonts 

`fresh`

- can use in shiny apps and shiny dashboards

- set parameters with `create_theme`

- set up `www` folder within app folder. We will save stylesheet (.css file) that `fresh` generates for us

### In the Two-File Shiny App

Within app directory, create `www` folder. In `scratch` folder of R project, make new script that houses the `create_theme()`

- create theme components

- output file to `www` folder in app folder

- set theme in `ui.R` file within the `navbarPage()`

### In dashboard

Within app directory, create `www` folder. In `scratch` folder of R project, make new script that houses the `create_theme()`

- create theme components

- output file to `www` folder in app folder

- set theme in `ui.R` file within the `body` object, at the top of `dashboardBody()`: fresh::Use_theme()

# CSS and SASS

CSS is a rule-based language. Begins with a `selector{}` (eg. h1, h2). Then we add `declarations:` (eg. color, letter-spacing) with a value associated (eg. green, 5px). Must end with a **;**

- Can add by calling `tags$` or `header``

- But better method of using stylesheets 

## `styles-dashboard`

- Add `www` folder to the app folder. Create a new `style.css` folder within that.

- Add any customization using the css syntax 

- to apply theme to go `ui.R` and within the `body` at the top of `dashboardBody()`:

```
tags$head( 
  tags$link(rel = "stylesheet", type = "text/css", href = "style.css") 
  )
```

## In Two-file app

If you have a current theme set, make sure to comment it out in `ui.R`. In your `www` folder, create a `.scss` file. 

In `global.R` file: load sass library, and compile css

- use `sass()` to use the input .scss file and convert it to .css file 

In `ui.R` file: create header to read in the .css file since the computer doesnt know how to read the .scss

```
header = tags$head(
    
    tags$link(rel = "stylesheet", type = "text/css", href = "sass-styles.css")
    
  )

```

- When updating the theme, make changes to the `.scss` file and it will automatically update the `.css` file
