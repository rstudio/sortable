context("shiny")

library(shiny)
test_that( "works with shiny ",{
  ui = shinyUI(fluidPage(
    title = "Does sortableR work in Shiny?"
    ,fluidRow(
      column(width = 6
             ,tags$div(id = "testdiv"
                       ,tags$h3("I should move")
                       ,tags$h3("Drag me")
                       ,tags$h3("I have secret superpowers")
             )
      )
    )
    ,sortableROutput("testsort")
  ))
  server = function(input,output){
    output$testsort <- renderSortableR({
      sortableR("testdiv")
    })
  }


  shinyApp(ui = ui, server=server)
})

