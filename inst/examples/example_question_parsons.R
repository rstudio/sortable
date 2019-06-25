if (require(learnr, quietly = TRUE)) {
  # to be used within a learnr tutorial...
  question_rank(
    "Sort the first 5 letters",
    answer(letters[1:5], correct = TRUE),
    allow_retry = TRUE,
    options = sortable_options(animation = 150)
  )
}
