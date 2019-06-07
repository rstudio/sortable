context("shiny")

library(shiny)
test_that( "works with shiny ",{

  testthat::skip("test does not bring value. Maybe implement with shinytest?")

  ui = shinyUI(fluidPage(
    title = "Does sortable work in Shiny?"
    ,fluidRow(
      column(width = 6
             ,tags$div(id = "testdiv"
                       ,tags$h3("I should move")
                       ,tags$h3("Drag me")
                       ,tags$h3("I have secret superpowers")
             )
      )
    )
    ,sortable_output("testsort")
  ))
  server = function(input,output){
    output$testsort <- rendersortable({
      sortable("testdiv")
    })
  }


  shinyApp(ui = ui, server=server)
})
