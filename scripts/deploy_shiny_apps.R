devtools::install_github("rstudio/sortable", upgrade = "always")

deploy_app <- function(
  app_dir,
  doc = glue::glue("{basename(app_dir)}_app.Rmd"),
  name = glue::glue("sortable_{basename(app_dir)}_app")
) {
  rsconnect::deployApp(
    appDir = app_dir,
    appPrimaryDoc = doc,
    appName = name,
    server = "shinyapps.io",
    account = "andrie-de-vries",
    forceUpdate = TRUE
  )
}

deploy_app(here::here("inst/shiny-examples/rank_list"))
deploy_app(here::here("inst/shiny-examples/bucket_list"))
deploy_app(here::here("inst/shiny-examples/drag_vars_to_plot"))
deploy_app(here::here("inst/shiny-examples/shiny_tabset"))

deploy_tutorial <- function(
  app_dir,
  doc = glue::glue("tutorial_{basename(app_dir)}.Rmd"),
  name = glue::glue("sortable_tutorial_{basename(app_dir)}")
) {
  # browser()
  rsconnect::deployApp(
    appDir = app_dir,
    appPrimaryDoc = doc,
    appName = name,
    server = "shinyapps.io",
    account = "andrie-de-vries",
    forceUpdate = TRUE
  )
}


deploy_tutorial(here::here("inst/tutorials/question_rank/"))


message("done")
