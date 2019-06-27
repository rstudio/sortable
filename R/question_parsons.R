#' Parsons problem question for learnr tutorials (experimental).
#'
#' @description
#'
#' Add Parsons Problem tasks to your `learnr` tutorials.  The
#' student can drag-and-drop the answer options into the desired order.
#'
#' This is a highly experimental, initial attempt at making Parsons problems in
#' `learnr` tutorials.  Parsons problems is a type of programming assignment
#' where the student must order statements in the correct order.
#'
#' If the task also includes indentation of the statements, it's called a
#' second-order Parsons problem. Note that second order problems have not yet
#' been implemented.
#'
#'
#' Features (design choices):
#'
#' * Items (except the last) in the right hand column will have a ` %>% `
#' appended.
#'
#' * Items (except the first) in the right hand column will automatically be
#' indented.
#'
#' * The initial values are shuffled into random answer order.
#'
#'
#' Lmitations:
#'
#' * It does not do any code evaluation
#'
#' * It does not support indentation
#'
#' * It assumes code is from the `tidyverse` and only supports the `magrittr`
#' pipe ` %>% ` operator
#'
#'
#' @section Creating a parsons question:
#'
#' Use `question_parsons` inside a `learnr` tutorial chunk
#'
#' For example:
#'
#' ````
#' ```{r iris}
#' question_parsons(
#'  initial = c(
#'   "iris",
#'   "mutate(...)",
#'   "summarize(...)",
#'   "print()"
#'  ),
#'  answer(c(
#'   "iris",
#'    "mutate(...)",
#'   "summarize(...)"
#'   ), correct = TRUE)
#' )
#' ```
#' ````
#'
#' On initialization, the initial values are randomized:
#'
#' \if{html}{\figure{parsons_app_initial.png}{options: width="60\%" max-width="500px" alt="Figure: Parsons initial state"}}
#'
#' As the student drags values to the right column, the `magrittr` gets
#' appended, and items are automatically indented:
#'
#' \if{html}{\figure{parsons_app_submit.png}{options: width="60\%" max-width="500px" alt="Figure: Parsons submit state"}}
#'
#'
#'
#' @param ... parameters passed onto \code{learnr::\link[learnr]{question}}.
#' @template options
#' @inheritParams learnr::question
#' @export
#' @example inst/examples/example_question_parsons.R
#' @examples
#' ## Example of a shiny app
#' if (interactive()) {
#'   app <- system.file("shiny-examples/parsons_app.R", package = "sortable")
#'   shiny::runApp(app)
#' }
question_parsons <- function(
  initial,
  ...,
  type = c("parsons_q"),
  correct = "Correct!",
  incorrect = "Incorrect",
  try_again = incorrect,
  message = NULL,
  post_message = NULL,
  loading = c("Loading: "),
  submit_button = "Submit Answer",
  try_again_button = "Try Again",
  allow_retry = TRUE,
  random_answer_order = TRUE,
  options = sortable_options()


) {
  z <- learnr::question(
    text = NULL,
    ...,
    type = "parsons_q",
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
    options = list(
      initial = initial,
      sortable_options = options
    )
  )
  z
}


#' @export
question_initialize_input.parsons_q <- function(question, answer_input, ...) {

  labels <- question$options$initial
  if (isTRUE(question$random_answer_order)) { # and we should randomize the order
    shuffle <- shiny::repeatable(sample, question$seed)
    labels <- shuffle(labels)
  }


  # return the parsons htmlwidget
  z <- parsons(
    input_id = c(question$ids$question, question$ids$answer),
    initial = list(
      setdiff(labels, answer_input),
      answer_input
    ),
    options = question$options$sortable_options,
    ...
  )
  z

}

#' @export
question_completed_input.parsons_q <- function(question, answer_input, ...) {
  # TODO display correct values with X or √ compared to best match
  # TODO DON'T display correct values (listen to an option?)

  labels <- question$options$initial
  if (isTRUE(question$random_answer_order)) { # and we should randomize the order
    shuffle <- shiny::repeatable(sample, question$seed)
    labels <- shuffle(labels)
  }

  parsons(
    input_id = c(question$ids$question, question$ids$answer),
    initial = list(
      setdiff(labels, answer_input),
      answer_input
    ),
    options = modifyList(
      question$options$sortable_options,
      sortable_options(disabled = TRUE)
    ),
    ...
  )
}

#' @export
question_is_valid.parsons_q <- function(question, answer_input, ...) {
  !is.null(answer_input)
}


#' @export
question_is_correct.parsons_q <- function(question, answer_input, ...) {
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
