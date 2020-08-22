

if (!requireNamespace("remotes")) install.packages("remotes")
remotes::install_cran("rsconnect")

# Set the account info for deployment.
rsconnect::setAccountInfo(
  name   = Sys.getenv("SHINYAPPS_NAME"),
  token  = Sys.getenv("SHINYAPPS_TOKEN"),
  secret = Sys.getenv("SHINYAPPS_SECRET")
)

# deploy all apps
source("scripts/deploy_apps.R")
