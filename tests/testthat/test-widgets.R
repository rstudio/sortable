context("widgets")


test_that( "works with other widgets",{
  testthat::skip("test does not bring value and adds dependencies")

  library(htmltools)
  library(DiagrammeR)
  library(knob)
  library(dygraphs)

  z <- html_print(tagList(
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
    ,sortable("testdiv")
  ))

  expect_is(z, "character")
  expect_true(grepl("index.html", z))
})

test_that( "boostrap example works",{
  testthat::skip("test does not bring value and adds dependencies")

  library(htmltools)

  htm <- '
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

  z <- html_print(
    fluidPage(fluidRow(
      column(width = 4
             ,tags$a(
               href = "https://jsbin.com/luxero/2/edit?html,js,output"
               ,"Bootstrap handle example"
             )
             ,HTML(htm)
             ,sortable("listWithHandle",options = list(handle=".glyphicon-move"))
      ))))
  expect_is(z, "character")
  expect_true(grepl("index.html", z))

})
