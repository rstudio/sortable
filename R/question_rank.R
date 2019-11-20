#' @importFrom learnr question_ui_initialize
#' @importFrom learnr question_ui_completed
#' @importFrom learnr question_ui_try_again
#' @importFrom learnr question_is_valid
#' @importFrom learnr question_is_correct
#' @importFrom learnr mark_as
#' @importFrom learnr disable_all_tags
NULL


#' Ranking question for learnr tutorials.
#'
#' Add interactive ranking tasks to your `learnr` tutorials.  The student can
#' drag-and-drop the answer options into the desired order.
#'
#' Each set of answer options must contain the same set of answer options. When
#' the question is completed, the first correct answer will be displayed.
#'
#' Note that, by default, the answer order is randomized.
#'
#' @param ... parameters passed onto [learnr::question()].
#' @template options
#' @inheritParams learnr::question
#'
#' @return A custom `learnr` question, with type `sortable_rank`.  See [learnr::question_methods()]
#' @export
#' @examples
#' ## Example of rank problem inside a learnr tutorial
#' if (interactive()) {
#'   learnr::run_tutorial("question_rank", package = "sortable")
#' }
question_rank <- function(
  text,
  ...,
  correct = "Correct!",
  incorrect = "Incorrect",
  loading = c("**Loading:** ", text, "<br/><br/><br/>"),
  submit_button = "Submit Answer",
  try_again_button = "Try Again",
  allow_retry = FALSE,
  random_answer_order = TRUE,
  options = sortable_options()
) {
  learnr::question(
    text = text,
    ...,
    type = "sortable_rank",
    correct = correct,
    incorrect = incorrect,
    loading  = loading,
    submit_button = submit_button,
    try_again_button = try_again_button,
    allow_retry = allow_retry,
    random_answer_order = random_answer_order,
    options = options
  )
}


#' @export
#' @seealso question_rank
question_ui_initialize.sortable_rank <- function(question, value, ...) {

  # quickly validate the all possible answers are possible
  answer <- question$answers[[1]]
  possible_answer_vals <- sort(answer$option)
  for (answer in question$answers) {
    if (!identical(
      possible_answer_vals,
      sort(answer$option)
    )) {
      stop(
        "All question_rank answers MUST have the same set of answers. (Order does not matter.) ",
        "\nBad set: ", paste0(answer$option, collapse = ", "),
        call. = FALSE
      )
    }
  }

  # if no label order has been provided
  if (!is.null(value)) {
    labels <- value
  } else {
    labels <- question$answers[[1]]$option

    # if the question is to be displayed in random order, shuffle the options
    if (
      isTRUE(question$random_answer_order) # and we should randomize the order
    ) {
      labels <- sample(labels, length(labels))
    }
  }


  # return the rank_list htmlwidget
  rank_list(
    text = question$question,
    input_id = question$ids$answer,
    labels = labels,
    options = question$options
  )
}

#' @export
#' @seealso question_rank
question_ui_completed.sortable_rank <- function(question, value, ...) {
  # TODO display correct values with X or √ compared to best match
  # TODO DON'T display correct values (listen to an option?)
  disable_all_tags(
    rank_list(
      text = question$question,
      input_id = question$ids$answer,
      labels = value,
      options = modifyList(
        question$options,
        sortable_options(disabled = TRUE)
      )
    )
  )
}

#' @export
#' @seealso question_rank
question_ui_try_again.sortable_rank <- function(question, value, ...) {
  disable_all_tags(
    rank_list(
      text = question$question,
      input_id = question$ids$answer,
      labels = value,
      options = modifyList(
        question$options,
        sortable_options(disabled = TRUE)
      )
    )
  )
}


#' @export
#' @seealso question_rank
question_is_correct.sortable_rank <- function(question, value, ...) {
  # for each possible answer, check if it matches
  for (answer in question$answers) {
    if (identical(answer$option, value)) {
      # if it matches, return the correct-ness and its message
      return(mark_as(answer$correct, answer$message))
    }
  }
  # no match found. not correct
  mark_as(FALSE, NULL)
}
