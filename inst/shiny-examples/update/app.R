## ---- update-bucket-list-app -----------------------------------------------
## Example shiny app with bucket list

library(shiny)
devtools::load_all(".")
library(magrittr)
source("mod.R")

ui <- fluidPage(
  tags$head(
    tags$style(HTML(".bucket-list-container {min-height: 350px;}"))
  ),
  mod_sortable_ui("bucket_lists")
)

server <- function(input, output, session) {

 mod_sortable_server("bucket_lists")

}




shinyApp(ui, server)
