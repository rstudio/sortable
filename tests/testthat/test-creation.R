context("creation")

test_that( "sortable_js makes a htmlwidget ", {
  expect_is( sortable_js( "" ), "htmlwidget" )
  expect_is( sortable_js( "" ), "sortable" )
})

test_that( "sortable_js height and width", {
  # by default sortable_js should be 0 height and width
  #  since intended to be used to provide dependencies
  #  and pass config options
  expect_equal( sortable_js( "" )$width, 0 )
  expect_equal( sortable_js( "" )$height, 0 )
  # however, someone might want to override height/width
  expect_equal( sortable_js( "", width = 100 )$width, 100 )
  expect_equal( sortable_js( "", height = 100 )$height, 100 )
})

test_that( "css_id and options passed as expected", {
  expect_identical( sortable_js( "an_id" )$x$css_id, "an_id" )
  expect_identical(
    sortable_js(
      "an_id",
      options = sortable_options(
        group = "name",
        sort = FALSE,
        disabled = FALSE
      )
    )$x,
    list(
      css_id = "an_id",
      options = modifyList(
        default_sortable_options(),
        sortable_options(
          group = "name",
          sort = FALSE,
          disabled = FALSE
        )
      )
    )
  )
})
