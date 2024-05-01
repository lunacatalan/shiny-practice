library(shinytest2)

test_that("{shinytest2} recording: name-greet", {
  app <- AppDriver$new(name = "name-greet", height = 759, width = 1211)
  app$set_inputs(name_input = "luna")
  app$click("greeting_button_input")
  app$expect_values(output = "greeting_output") # specify what to look at
})


test_that("{shinytest2} recording: blank-greet", {
  app <- AppDriver$new(name = "blank-greet", height = 759, width = 1211)
  app$click("greeting_button_input")
  app$expect_values(output = "greeting_output")
})

# these keep failing and I dont know why
test_that("{shinytest2} recording: desktop-save", {
  app <- AppDriver$new(name = "desktop-save", height = 759, width = 1211)
  app$upload_file(csv_input = "cols-and-data1.csv")
  app$expect_values(output = "summary_table_output")
})

# these keep failing and I dont know why
test_that("{shinytest2} recording: upload-incorrect-cols", {
  app <- AppDriver$new(name = "upload-incorrect-cols", height = 759, width = 1211)
  app$upload_file(csv_input = "incorrect-cols.csv")
  app$expect_values("summary_table_output")
})


test_that("{shinytest2} recording: all-3-species-plot", {
  app <- AppDriver$new(name = "all-3-species-plot", height = 759, width = 1211)
  app$expect_values(output = "scatterplot_output")
})


test_that("{shinytest2} recording: select-adelie-plot", {
  app <- AppDriver$new(name = "select-adelie-plot", height = 759, width = 1211)
  app$set_inputs(penguinSpp_scatterplot_input_open = TRUE, allow_no_input_binding_ = TRUE)
  app$set_inputs(penguinSpp_scatterplot_input = c("Adelie", "Gentoo"))
  app$set_inputs(penguinSpp_scatterplot_input = "Adelie")
  app$expect_values(output = "scatterplot_output")
  app$set_inputs(penguinSpp_scatterplot_input_open = FALSE, allow_no_input_binding_ = TRUE)
})
