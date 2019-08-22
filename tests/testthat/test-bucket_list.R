context("bucket_list")

test_that("Can use add_rank_list", {
  z <- add_rank_list(text = "missing", labels = NULL, input_id = NULL)
  expect_is(z, "add_rank_list")
})


test_that("Can create bucket_list", {

  z <- bucket_list(
    header = "This is a bucket list. You can drag items between the lists.",
    add_rank_list(
      text = "Drag from here",
      labels = c("a", "bb", "ccc")
    ),
    add_rank_list(
      text = "to here",
      labels = NULL,
      input_id = "input_to"
    )
  )
  expect_is(z, "bucket_list")
})
