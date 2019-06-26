context("learnr question_parsons")

test_that( "init display validates", {

  question <- question_parsons(
    # "Sort the first 5 letters",
    initial = LETTERS[1:5],
    learnr::answer(LETTERS[1:5], correct = TRUE),
    learnr::answer(rev(LETTERS[1:5]), correct = FALSE, "Other direction!")
  )
  expect_s3_class(question, "parsons_q")

  expect_silent({
    question_initialize_input(question, "ignored")
  })

  expect_silent({
    question_completed_input(question, LETTERS[5:1])
  })

  expect_true(
    question_is_valid(question, letters[1:5])
  )
  expect_false(
    question_is_valid(question, NULL)
  )

  expect_identical(
    question_is_correct(question, LETTERS[1:5]),
    learnr::question_is_correct_value(TRUE, NULL)
  )
  tmp_answer <- learnr::answer("ignored", FALSE, "Other direction!")
  expect_identical(
    question_is_correct(question, LETTERS[5:1]),
    learnr::question_is_correct_value(FALSE, tmp_answer$message)
  )
  expect_identical(
    question_is_correct(question, letters[1:5]),
    learnr::question_is_correct_value(FALSE, NULL)
  )

})
