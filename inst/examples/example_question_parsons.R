if (require(learnr, quietly = TRUE)) {
  # to be used within a learnr tutorial...
  question_parsons(
    initial = c(
      "iris",
      "mutate(...)",
      "summarize(...)",
      "print()"
    ),
    answer(c(
      "iris",
      "mutate(...)",
      "summarize(...)"
    ), correct = TRUE)
  )
}

