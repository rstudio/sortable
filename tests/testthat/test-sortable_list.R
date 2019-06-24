context("sortable_list")

test_that("Can create sortable_list", {
  z <- sortable_list(
    text = "You can drag, drap and re-order these items:",
    labels = c("one", "two", "three", "four", "five"),
    output_id = "example_2"
  )

  expect_is(z, "sortable_list")

})
