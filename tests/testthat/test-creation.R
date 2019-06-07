context("creation")

test_that( "sortable makes a htmlwidget ", {
  expect_is( sortable( "" ), "htmlwidget" )
  expect_is( sortable( "" ), "sortable" )
})

test_that( "sortable height and width", {
  # by default sortable should be 0 height and width
  #  since intended to be used to provide dependencies
  #  and pass config options
  expect_equal( sortable( "" )$width, 0 )
  expect_equal( sortable( "" )$height, 0 )
  # however, someone might want to override height/width
  expect_equal( sortable( "", width = 100 )$width, 100 )
  expect_equal( sortable( "", height = 100 )$height, 100 )
})

test_that( "selector and options passed as expected", {
  expect_identical( sortable( "an_id" )$x$selector, "an_id" )
  expect_identical(
    sortable( "an_id", options = list( group = "name", sort = F, disabled = F ) )$x,
    list( selector = "an_id", options = list( group = "name", sort = F, disabled = F ))
  )
})
