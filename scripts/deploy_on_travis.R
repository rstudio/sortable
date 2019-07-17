# Deploy tutorial to ShinyApps.io


remotes::install_cran("rsconnect")
remotes::install_cran("glue")

# Set the account info for deployment.
rsconnect::setAccountInfo(
  name   = Sys.getenv("shinyapps_name"),
  token  = Sys.getenv("shinyapps_token"),
  secret = Sys.getenv("shinyapps_secret")
)

# deploy all apps
source("scripts/deploy_on_travis.R")
