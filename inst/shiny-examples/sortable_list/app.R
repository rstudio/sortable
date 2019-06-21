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
      tags$p("Drag the items in the correct order"),
      sortable_list(
        "sortable_list_1",
        labels = shuffle(c("one", "two", "three", "four", "five"))
      )
    )
  ),
  fluidRow(
    verbatimTextOutput("results_list_1")
  )
)

server <- function(input,output) {
  output$results_list_1 <-
    renderPrint(
      input$sortable_list_1
    )
}


shiny::shinyApp(ui, server)
