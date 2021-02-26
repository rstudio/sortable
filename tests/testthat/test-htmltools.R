library(htmltools)
test_that( "works with tags ", {
  z <- html_print(
    viewer = NULL,
    tagList(
      tags$h1( "Check to make sure items move"),
      HTML("
        <ul id=\"items\">
          <li>item 1</li>
          <li>item 2</li>
          <li>item 3</li>
        </ul>
      "),
      sortable_js( "items" )
    )
  )
  expect_type(z, "character")

})

test_that("htmlwidget produces correct output", {
  z <- sortable_output("test")
  expect_type(z, "list")
  expect_s3_class(z, "shiny.tag.list")

  zr <- render_sortable(z)
  expect_s3_class(zr, "shiny.render.function")
})
