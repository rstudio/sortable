# install rsconnect and glue
if (!requireNamespace("remotes")) install.packages("remotes")
if (!requireNamespace("rsconnect")) remotes::install_cran("rsconnect")
if (!requireNamespace("glue"))      remotes::install_cran("glue")

# Set the account info for deployment.
rsconnect::setAccountInfo(
  name   = Sys.getenv("SHINYAPPS_NAME"),
  token  = Sys.getenv("SHINYAPPS_TOKEN"),
  secret = Sys.getenv("SHINYAPPS_SECRET")
)

deploy_app <- function(
  app_dir,
  name = glue::glue("sortable_{basename(app_dir)}_app"),
  ...
) {
  server  <- "shinyapps.io"
  account <- "andrie-de-vries"

  all_apps <- rsconnect::applications(account = account, server = server)
  last_deployed <- all_apps[all_apps[["name"]] == name, "updated_time"]
  last_updated <- max(file.mtime(list.files(app_dir, recursive = TRUE, full.names = TRUE)))

  last_deployed <- as.POSIXct(last_deployed, format = "%FT%T")

  if (!length(last_deployed) || last_updated > last_deployed) {
    message("\n")
    message("Deploying: ", name)
    message("\n")
    rsconnect::deployApp(
      appDir = app_dir,
      appName = name,
      server = server,
      account = account,
      forceUpdate = TRUE,
      ...
    )
  } else {
    message("Nothing to do for ", name)
  }
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
  invisible(lapply(
    dir(path, full.names = TRUE),
    function(path) {
      if (dir.exists(path)) {
        fn(path)
      }
    }
  ))
}



deploy_folder(system.file("shiny", package = "sortable"), deploy_app)
deploy_folder(system.file("shiny", package = "sortable"), deploy_tutorial)

message("done")
