#####

context("creation")

test_that( "sortableR makes a htmlwidget ", {
  expect_is( sortableR( "" ), "htmlwidget" )
  expect_is( sortableR( "" ), "sortableR" )
})

test_that( "sortableR height and width", {
  # by default sortableR should be 0 height and width
  #  since intended to be used to provide dependencies
  #  and pass config options
  expect_equal( sortableR( "" )$width, 0 )
  expect_equal( sortableR( "" )$height, 0 )
  # however, someone might want to override height/width
  expect_equal( sortableR( "", width = 100 )$width, 100 )
  expect_equal( sortableR( "", height = 100 )$height, 100 )
})

test_that( "selector and options passed as expected", {
  expect_identical( sortableR( "an_id" )$x$selector, "an_id" )
  expect_identical(
    sortableR( "an_id", options = list( group = "name", sort = F, disabled = F ) )$x
    ,list( selector = "an_id", options = list( group = "name", sort = F, disabled = F ))
  )
})

#####
context("interoperability")

library(htmltools)
test_that( "works with tags ", {
  html_print(tagList(
    tags$h1( "Check to make sure items move")
    ,HTML('
      <ul id="items">
        <li>item 1</li>
        <li>item 2</li>
        <li>item 3</li>
      </ul>
    ')
    ,sortableR( "items" )
  ))
})

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

library(DiagrammeR)
library(knob)
library(dygraphs)
test_that( "works with other widgets",{
  html_print(tagList(
    tags$h1("Does sortable work with other htmlwidgets? Try it!")
    ,tags$div(id = "testdiv"
      ,tags$div(style = "float:left;border:solid 0.3em blue;"
        ,grViz("digraph {A -> B;}", height = 200, width = 200)
      )
      ,tags$div(style = "float:left;border:solid 0.3em gray;"
        ,grViz("digraph {C -> D;}", height = 200, width = 200)
      )
      ,tags$div(style = "float:left;border:solid 0.3em purple;"
        ,"note: grab from corners"
        ,knob(90,0,360,width=180,height=180)
      )
      ,tags$div(style = "float:left;border:solid 0.3em red;"
        ,dygraph(cbind(mdeaths, fdeaths),height = 200, width = 400)
      )
    )
    ,sortableR("testdiv")
  ))
})

test_that( "boostrap example works",{
  html_print(fluidPage(fluidRow(column(width = 4
    ,tags$a(
      href = "http://jsbin.com/luxero/2/edit?html,js,output"
      ,"Bootstrap handle example"
    )
    ,HTML(
'
<!-- List with handle -->
<div id="listWithHandle" class="list-group">
  <div class="list-group-item">
    <span class="badge">14</span>
    <span class="glyphicon glyphicon-move" aria-hidden="true"></span>
    Drag me by the handle
  </div>
  <div class="list-group-item">
    <span class="badge">2</span>
    <span class="glyphicon glyphicon-move" aria-hidden="true"></span>
    You can also select text
  </div>
  <div class="list-group-item">
    <span class="badge">1</span>
    <span class="glyphicon glyphicon-move" aria-hidden="true"></span>
    Best of both worlds!
  </div>
</div>
'
    )
    ,sortableR("listWithHandle",options = list(handle=".glyphicon-move"))
  ))))
})
