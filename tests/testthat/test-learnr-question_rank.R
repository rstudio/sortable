context("learnr question_rank")

test_that( "init display validates", {

  question <- question_rank(
    "Sort the first 5 letters",
    learnr::answer(LETTERS[1:5], correct = TRUE),
    learnr::answer(rev(LETTERS[1:5]), correct = FALSE, "Other direction!")
  )
  expect_s3_class(question, "sortable_rank")

  expect_silent({
    learnr::question_ui_initialize(question, "ignored")
  })

  expect_error(
    learnr::question_ui_initialize(
      question_rank(
        "Sort the first 5 letters",
        learnr::answer(LETTERS[1:5], correct = TRUE),
        learnr::answer(letters[1:5], correct = FALSE, "causes error"),
        learnr::answer(rev(LETTERS[1:5]), correct = FALSE, "Other direction!")
      )
    ),
    "answers MUST have the same set"
  )

  expect_silent(
    learnr::question_ui_try_again(question, rev(LETTERS[1:5]))
  )

  expect_is(
    learnr::question_ui_try_again(question, rev(LETTERS[1:5])),
    "rank_list"
  )


  expect_silent({
    learnr::question_ui_completed(question, LETTERS[5:1])
  })

  expect_true(
    learnr::question_is_valid(question, letters[1:5])
  )
  expect_false(
    learnr::question_is_valid(question, NULL)
  )

  expect_identical(
    learnr::question_is_correct(question, LETTERS[1:5]),
    mark_as(TRUE, NULL)
  )

  tmp_answer <- learnr::answer("ignored", FALSE, "Other direction!")
  expect_identical(
    learnr::question_is_correct(question, LETTERS[5:1]),
    learnr::mark_as(FALSE, tmp_answer$message)
  )
  expect_identical(
    learnr::question_is_correct(question, letters[1:5]),
    learnr::mark_as(FALSE, NULL)
  )

})
