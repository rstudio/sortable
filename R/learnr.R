

#' Learnr question method for [sortable_js]
#'
#' Questions will be created using the first set of options.
#' Each set of answer options must contain the same set of answer options.
#' When the question is completed, the first correct answer will be displayed.
#'
#' @param ... parameters passed onto \code{learnr::\link[learnr]{question}}.
#' @template options
#' @inheritParams learnr::question
#' @export
#' @examples
#' if (require(learnr, quietly = TRUE)) {
#'   # to be used within a learnr tutorial...
#'   question_sortable(
#'     "Sort the first 5 letters",
#'     answer(letters[1:5], correct = TRUE),
#'     allow_retry = TRUE,
#'     options = sortable_options(animation = 150)
#'   )
#' }
question_sortable <- function(..., random_answer_order = TRUE, options = sortable_options()) {
  learnr::question(
    ...,
    random_answer_order = random_answer_order,
    type = "sortable",
    options = options
  )
}


#' Learnr methods for [sortable_js]
#'
#' Questions will be created using the first set of options.
#' Each set of answer options must contain the same set of answer options.
#' When the question is completed, the first correct answer will be displayed.
#'
#' @inheritParams learnr::question_initialize_input
#' @rdname sortable_learnr
#' @method question_initialize_input sortable
#' @seealso \code{\link{question_sortable}}
#' @export
#' @examples
#' if (require(learnr, quietly = TRUE)) {
#'   # to be used within a learnr tutorial...
#'   question_sortable(
#'     "Sort the first 5 letters",
#'     answer(letters[1:5], correct = TRUE),
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


  # return the sortable htmlwidget
  sortable_list(
    input_id = question$ids$answer,
    labels = labels,
    options = question$options
  )
}

#' @rdname sortable_learnr
#' @method question_completed_input sortable
#' @export
question_completed_input.sortable <- function(question, answer_input, ...) {
  # TODO display correct values with X or √ compared to best match
  # TODO DON'T display correct values (listen to an option?)
  sortable_list(
    input_id = question$ids$answer,
    labels = answer_input,
    options = modifyList(
      question$options,
      sortable_options(disabled = TRUE)
    )
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
