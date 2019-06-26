if (require(learnr, quietly = TRUE)) {
  # to be used within a learnr tutorial...
  question_parsons(
    answer(c(
      "iris",
      "mutate(...)",
      "summarize(...)",
      "print()"
    ), correct = FALSE),
    answer(c(
      "iris",
      "mutate(...)",
      "summarize(...)"
    ), correct = TRUE)
  )
}

