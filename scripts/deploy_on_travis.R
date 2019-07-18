

if (!requireNamespace("remotes")) install.packages("remotes")
remotes::install_cran("rsconnect")

# Set the account info for deployment.
rsconnect::setAccountInfo(
  name   = Sys.getenv("shinyapps_name"),
  token  = Sys.getenv("shinyapps_token"),
  secret = Sys.getenv("shinyapps_secret")
)

# deploy all apps
source("scripts/deploy_apps.R")
