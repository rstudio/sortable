## -- example-sortable-js-capture -----------------------------------------
# Simple example of sortable_js_capture.
# Important: set the tags CSS `id` equal to the sortable_js `css_id`

if(interactive()) {
  library(shiny)
  library(sortable)

  ui <- fluidPage(
    div(
      id = "sortable",
      div(id = 1, `data-rank-id` = "HELLO", class = "well", "Hello"),
      div(id = 2, `data-rank-id` = "WORLD", class = "well", "world")
    ),
    verbatimTextOutput("chosen"),
    sortable_js(
      css_id = "sortable",
      options = sortable_options(
        onSort = sortable_js_capture_input(input_id = "selected")
      )
    )
  )

  server <- function(input, output){
    output$chosen <- renderPrint(input$selected)
  }

  shinyApp(ui, server)
}


