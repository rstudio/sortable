library(shiny)
library(sortable)

ui <- fluidPage(
  div(
    # style = "width: 500px", id = "my-ranklist",
    rank_list(
      text = "Horizontal rank list",
      labels = c("/", "26", "2022", "August", "/"),
      input_id = "rank",
      orientation = "horizontal",
      # class = "default-sortable horizontal"
      class = "default-sortable"
    )
  )
)

server <- function(input, output, session) {}

shinyApp(ui, server)
