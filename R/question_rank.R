#' @importFrom learnr question_initialize_input
#' @importFrom learnr question_completed_input
#' @importFrom learnr question_try_again_input
#' @importFrom learnr question_is_valid
#' @importFrom learnr question_is_correct
#' @importFrom learnr question_is_correct_value
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
#' @param ... parameters passed onto \code{learnr::\link[learnr]{question}}.
#' @template options
#' @inheritParams learnr::question
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
    type = "rank",
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
question_initialize_input.rank <- function(question, answer_input, ...) {

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
  if (!is.null(answer_input)) {
    labels <- answer_input
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
question_completed_input.rank <- function(question, answer_input, ...) {
  # TODO display correct values with X or √ compared to best match
  # TODO DON'T display correct values (listen to an option?)
  rank_list(
    text = question$question,
    input_id = question$ids$answer,
    labels = answer_input,
    options = modifyList(
      question$options,
      sortable_options(disabled = TRUE)
    )
  )
}

#' @export
question_try_again_input.rank <- function(question, answer_input, ...) {
  rank_list(
    text = question$question,
    input_id = question$ids$answer,
    labels = answer_input,
    options = modifyList(
      question$options,
      sortable_options(disabled = TRUE)
    )
  )
}

#' @export
question_is_valid.rank <- function(question, answer_input, ...) {
  !is.null(answer_input)
}


#' @export
question_is_correct.rank <- function(question, answer_input, ...) {
  # for each possible answer, check if it matches
  for (answer in question$answers) {
    if (identical(answer$option, answer_input)) {
      # if it matches, return the correct-ness and its message
      return(question_is_correct_value(answer$is_correct, answer$message))
    }
  }
  # no match found. not correct
  question_is_correct_value(FALSE, NULL)
}
