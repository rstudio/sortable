context("bucketable_list")

test_that("Can use add_sortable_list", {
  z <- add_sortable_list(text = "missing", labels = NULL, input_id = NULL)
  expect_is(z, "add_sortable_list")
})


test_that("Can create bucketable_list", {
  z <- bucketable_list(
    header = "This is a bucketable list. You can drag items between the lists.",
    group_name = "bucketable",
    add_sortable_list(
      text = "Drag from here",
      labels = c("a", "bb", "ccc"),
      input_id = NULL
    ),
    add_sortable_list(
      text = "to here",
      labels = NULL,
      input_id = "input_to"
    )
  )

  expect_is(z, "bucketable_list")
})
