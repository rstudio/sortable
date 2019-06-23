## Bucketable list

bucketable_list(
  header = "This is a bucketable list. You can drag items between the lists.",
  group_name = "bucketable",
  add_sortable_list(
    text = "Drag from here",
    labels = c("a", "bb", "ccc")
  ),
  add_sortable_list(
    text = "to here",
    labels = NULL
  )
)

## Bucketable list with three columns

bucketable_list(
  header = c("Sort these items into Letters and Numbers"),
  add_sortable_list(
    text = "Sort these items",
    labels = sample(c(1:3, letters[1:2]))
  ),
  add_sortable_list(
    text = "into Letters",
    labels = NULL
  ),
  add_sortable_list(
    text = "and Numbers",
    labels = NULL
  ),
  output_id = paste0("output", 1:3),
  group_name = "bucket_test"
)


