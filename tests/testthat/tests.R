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

context("works with tags")
library(htmltools)
test_that( "visual inspection of html ", {
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
