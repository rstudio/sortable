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
#' \if{html}{\figure{parsons_app_submit.png}{options: width="60\%" max-width="500px" alt="Figure: Parsons submit state"}}
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
#' Limitations:
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
