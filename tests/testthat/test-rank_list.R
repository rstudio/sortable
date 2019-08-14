context("rank_list")

test_that("Can create rank_list", {
  z <- rank_list(
    text = "You can drag, drap and re-order these items:",
    labels = c("one", "two", "three", "four", "five"),
    input_id = "example_2"
  )

  expect_is(z, "rank_list")
})
