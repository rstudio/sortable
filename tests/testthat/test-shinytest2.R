library(shinytest2)

app_dir <- system.file("shiny/update_rank_list", package = "sortable")

test_that("{shinytest2} recording: test_update_title", {
  app <- AppDriver$new(
    variant = platform_variant(),
    name = "test_update_title",
    app_dir = app_dir,
    seed = 123,
    height = 945,
    width = 1619
  )
  app$expect_screenshot()
  app$click("btnUpdateRank")
  app$expect_screenshot()
})


test_that("{shinytest2} recording: test_change_labels", {
  app <- AppDriver$new(
    name = "test_change_labels",
    app_dir = app_dir,
    seed = 123,
    height = 945,
    width = 1619
  )
  app$expect_values(output = "results")
  app$click("btnChangeLabels")
  app$set_inputs(
    rank_list_1 = c("W", "C", "R", "F", "I"),
    allow_no_input_binding_ = TRUE,
    priority_ = "event"
  )
  app$expect_values(output = "results")
})


test_that("{shinytest2} recording: test_empty_labels", {
  app <- AppDriver$new(
    name = "test_empty_labels",
    app_dir = app_dir,
    seed = 123,
    height = 945,
    width = 1619
  )
  app$expect_values(output = "results")
  app$click("btnEmptyLabels")
  app$set_inputs(
    rank_list_1 = character(0),
    allow_no_input_binding_ = TRUE,
    priority_ = "event"
  )
  app$expect_values(output = "results")
  app$click("btnChangeLabels")
  app$set_inputs(
    rank_list_1 = c("M", "I", "Z", "W", "Q"),
    allow_no_input_binding_ = TRUE,
    priority_ = "event"
  )
  app$expect_values(output = "results")
})
