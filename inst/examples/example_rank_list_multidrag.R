## - example-rank-list-multidrag ------------------------------------------

if (interactive()) {
  rank_list(
    text = "You can select multiple items and drag as a group:",
    labels = c("one", "two", "three", "four", "five"),
    input_id = "example_2",
    options = sortable_options(
      multiDrag = TRUE
    )
  )
}
