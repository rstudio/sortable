context("htmltools")

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
      sortable( "items" )
    )
  )
  expect_is(z, "character")
})
