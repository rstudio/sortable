library(shiny)
library(sortable)

set.seed(123456) # to make sample() reproducible
labels <- sample(month.name[1:5])

ui <- fluidPage(
  div(
    rank_list(
      text = "Horizontal rank list",
      labels = labels,
      input_id = "rank_h",
      orientation = "horizontal"
    )
  ),
  div(
    rank_list(
      text = "Default rank list (vertical)",
      labels = labels,
      input_id = "rank"
    )
  )
)

server <- function(input, output, session) {}

shinyApp(ui, server)
