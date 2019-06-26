#' Parsons problem question for learnr tutorials.
#'
#' Add Parsons Problem tasks to your `learnr` tutorials.  The student can
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
#' @example inst/examples/example_question_parsons.R
question_parsons <- function(
  ...,
  text = c("Drag from here", "Construct your solution here"),
  type = c("parsons"),
  correct = "Correct!",
  incorrect = "Incorrect",
  try_again = incorrect,
  message = NULL,
  post_message = NULL,
  loading = c("**Loading:** ", text, "<br/><br/><br/>"),
  submit_button = "Submit Answer",
  try_again_button = "Try Again",
  allow_retry = TRUE,
  random_answer_order = TRUE,
  options = sortable_options()


) {
  learnr::question(
    ...,
    text = text,
    type = "parsons",
    correct =  correct,
    incorrect =  incorrect,
    try_again = try_again,
    message = message,
    post_message = post_message,
    loading = loading,
    submit_button =  submit_button,
    try_again_button =  try_again_button,
    allow_retry = allow_retry,
    random_answer_order = random_answer_order,
    options = options
  )
}


#' @export
question_initialize_input.parsons <- function(question, answer_input, ...) {


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

  # return the parsons htmlwidget
  parsons(
    input_id = c(question$ids$question, question$ids$answer),
    labels = labels,
    options = question$options,
    ...
  )

}

#' @export
question_completed_input.parsons <- function(question, answer_input, ...) {
  # TODO display correct values with X or √ compared to best match
  # TODO DON'T display correct values (listen to an option?)
  parsons(
    input_id = c(question$ids$question, question$ids$answer),
    labels = question$answers[[1]]$option,
    options = modifyList(
      question$options,
      sortable_options(disabled = TRUE)
    ),
    ...
  )
}

#' @export
question_is_valid.parsons <- function(question, answer_input, ...) {
  !is.null(answer_input)
}


#' @export
question_is_correct.parsons <- function(question, answer_input, ...) {
  # for each possible answer, check if it matches
  for (answer in question$answers) {
    if (identical(answer$option, answer_input)) {
      # if it matches, return the correct-ness and its message
      return(question_is_correct_value(answer$is_correct, answer$message))
    }
  }
  # no match found. not correct
  return(question_is_correct_value(FALSE, NULL))
}
