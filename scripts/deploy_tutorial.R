# Deploy tutorial to ShinyApps.io

library(rsconnect)
library(glue)
remotes::install_github("rstudio/sortable", dependencies = NA)


# Set the account info for deployment.
setAccountInfo(
  name   = Sys.getenv("shinyapps_name"),
  token  = Sys.getenv("shinyapps_token"),
  secret = Sys.getenv("shinyapps_secret")
)

# Deploy the application.

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


deploy_tutorial("inst/tutorials/question_parsons/")
