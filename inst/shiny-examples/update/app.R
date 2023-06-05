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
  mod_sortable_ui("mod1"),
  mod_sortable_ui("mod2")
)

server <- function(input, output, session) {

  mod_sortable_server("mod1")
  mod_sortable_server("mod2")

}




shinyApp(ui, server)
