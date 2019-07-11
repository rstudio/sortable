## -- example-bucket-list ---------------------------------------------

## bucket list

bucket_list(
  header = "This is a bucket list. You can drag items between the lists.",
  add_rank_list(
    text = "Drag from here",
    labels = c("a", "bb", "ccc"),
    input_id = NULL
  ),
  add_rank_list(
    text = "to here",
    labels = NULL,
    input_id = NULL
  )
)

## bucket list with three columns

bucket_list(
  header = c("Sort these items into Letters and Numbers"),
  add_rank_list(
    text = "Drag from here",
    labels = sample(c(1:3, letters[1:2])),
    input_id = NULL
  ),
  add_rank_list(
    text = "Letters",
    input_id = NULL
  ),
  add_rank_list(
    text = "Numbers",
    input_id = NULL
  )
)
