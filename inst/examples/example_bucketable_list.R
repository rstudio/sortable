## -- example-bucketable-list ---------------------------------------------

## Bucketable list

bucketable_list(
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
    input_id = NULL
  )
)

## Bucketable list with three columns

bucketable_list(
  header = c("Sort these items into Letters and Numbers"),
  add_sortable_list(
    text = "Drag from here",
    labels = sample(c(1:3, letters[1:2])),
    input_id = NULL
  ),
  add_sortable_list(
    text = "Letters",
    input_id = NULL
  ),
  add_sortable_list(
    text = "Numbers",
    input_id = NULL
  )
)


