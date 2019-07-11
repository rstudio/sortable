# Deploy tutorial to ShinyApps.io


remotes::install_cran("rsconnect")
remotes::install_cran("glue")

# must install from github for deploy to work
remotes::install_github("rstudio/sortable", dependencies = NA)


# Set the account info for deployment.
rsconnect::setAccountInfo(
  name   = Sys.getenv("shinyapps_name"),
  token  = Sys.getenv("shinyapps_token"),
  secret = Sys.getenv("shinyapps_secret")
)

# Deploy the application.

deploy_tutorial <- function(
  app_dir,
  doc = dir(app_dir, pattern = "\\.Rmd$")[1],
  name = glue::glue("sortable_tutorial_{basename(app_dir)}")
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


# deploy all leanr tutorials
lapply(
  dir("inst/tutorials", full.names = TRUE),
  function(path) {
    if (dir.exists(path)) {
      deploy_tutorial(path)
    }
  }
)
