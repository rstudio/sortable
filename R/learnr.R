

#' Learnr methods for sortable_learnr
#'
#' Questions will be created using the first set of options.
#' Each set of answer options must contain the same set of answer options.
#' When the question is completed, the first correct answer will be displayed.
#'
#' @inheritParams learnr::question_initialize_input
#' @rdname sortable_learnr
#' @method question_initialize_input sortable
#' @export
#' @examples
#' if (require(learnr, quietly = TRUE)) {
#'   # to be used within a learnr tutorial...
#'   question(
#'     "Sort the first 5 letters",
#'     answer(letters[1:5], correct = TRUE),
#'     type = "sortable",
#'     allow_retry = TRUE
#'   )
#'
#' }
question_initialize_input.sortable <- function(question, answer_input, ...) {

  # quickly validate the all possible answers are possible
  answer <- question$answers[[1]]
  possible_answer_vals <- sort(answer$option)
  for (answer in question$answers) {
    if (!identical(
      possible_answer_vals,
      sort(answer$option)
    )) {
      stop(
        "All sortable answers MUST have the same set of answers. (Order does not matter.) ",
        "\nBad set: ", paste0(answer$option, collapse = ", "),
        call. = FALSE
      )
    }
  }

  labels <- question$answers[[1]]$option
  # if the question is to be displayed in random order, shuffle the options
  if (isTRUE(question$random_answer_order)) {
    labels <- sample(labels, length(labels))
  }
  sortable_list(
    question$ids$answer,
    labels,
    options = question$options
  )
}

#' @rdname sortable_learnr
#' @method question_completed_input sortable
#' @export
question_completed_input.sortable <- function(question, answer_input, ...) {
  # TODO display correct values with X or √ compared to best match
  # TODO DON'T display correct values (listen to an option)
  sortable_list(
    question$ids$answer,
    answer_input,
    options = question$options
  )
}

#' @rdname sortable_learnr
#' @method question_is_valid sortable
#' @export
question_is_valid.sortable <- function(question, answer_input, ...) {
  !is.null(answer_input)
}


#' @rdname sortable_learnr
#' @method question_is_correct sortable
#' @export
question_is_correct.sortable <- function(question, answer_input, ...) {
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




#' @importFrom learnr question_initialize_input
#' @importFrom learnr question_completed_input
#' @importFrom learnr question_is_valid
#' @importFrom learnr question_is_correct
#' @importFrom learnr question_is_correct_value
NULL
