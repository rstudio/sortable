## - example-rank-list-swap -----------------------------------------------

if (interactive()) {
  rank_list(
    text = "You can re-order these items, and notice the swapping behaviour:",
    labels = c("one", "two", "three", "four", "five"),
    input_id = "example_2",
    options = sortable_options(
      swap = TRUE
    )
  )
}
