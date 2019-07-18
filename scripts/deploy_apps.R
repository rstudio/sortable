
if (!requireNamespace("remotes")) install.packages("remotes")

# install rsconnect and glue
remotes::install_cran("rsconnect")
remotes::install_cran("glue")

# install the latest
remotes::install_github("rstudio/sortable", upgrade = "always")



deploy_app <- function(
  app_dir,
  name = glue::glue("sortable_{basename(app_dir)}_app"),
  ...
) {
  cat("\n\n\n")
  message("Deploying: ", name)
  cat("\n")
  rsconnect::deployApp(
    appDir = app_dir,
    appName = name,
    server = "shinyapps.io",
    account = "andrie-de-vries",
    forceUpdate = TRUE,
    ...
  )
}

deploy_tutorial <- function(
  app_dir,
  doc = dir(app_dir, pattern = "\\.Rmd$")[1],
  name = glue::glue("sortable_tutorial_{basename(app_dir)}")
) {
  deploy_app(
    app_dir = app_dir,
    name = name,
    appPrimaryDoc = dir(app_dir, pattern = "\\.Rmd$")[1]
  )
}


deploy_folder <- function(path, fn) {
  lapply(
    dir(path, full.names = TRUE),
    function(path) {
      if (dir.exists(path)) {
        fn(path)
      }
    }
  )
}

deploy_folder("inst/shiny-examples", deploy_app)
deploy_folder("inst/tutorials", deploy_tutorial)

message("done")
