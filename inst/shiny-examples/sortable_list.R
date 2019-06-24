library(shiny)
library(sortable)

shuffle <- function(x) {
  sample(x, size = length(x))
}

ui <- fluidPage(
  fluidRow(
    column(
      width = 12,
      tags$h2("This is a sortable list"),
      sortable_list(
        text = "Drag the items in the correct order",
        labels = shuffle(c("one", "two", "three", "four", "five")),
        output_id = "sortable_list_1"
      )
    )
  ),
  fluidRow(
    verbatimTextOutput("results")
  )
)

server <- function(input,output) {
  output$results <-
    renderPrint(
      input$sortable_list_1 # This matches the output_id of the sortable list
    )
}


shinyApp(ui, server)
