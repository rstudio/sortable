## -- example-bucket-list ---------------------------------------------

## bucket list

if(interactive()) {
  bucket_list(
    header = "This is a bucket list. You can drag items between the lists.",
    add_rank_list(
      text = "Drag from here",
      labels = c("a", "bb", "ccc")
    ),
    add_rank_list(
      text = "to here",
      labels = NULL
    )
  )
}

## bucket list with three columns

if(interactive()) {
  bucket_list(
    header = c("Sort these items into Letters and Numbers"),
    add_rank_list(
      text = "Drag from here",
      labels = sample(c(1:3, letters[1:2]))
    ),
    add_rank_list(
      text = "Letters"
    ),
    add_rank_list(
      text = "Numbers"
    )
  )
}
