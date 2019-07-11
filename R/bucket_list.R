#' Add a rank list inside bucket list.
#'
#' Since a [bucket_list] can contain more than one [rank_list], you need
#' an easy way to define the contents of each individual rank list.  This
#' function serves as a specification of a rank list.
#'
#' @inheritParams rank_list
#' @param ... Other arguments passed to `rank_list`
#'
#' @export
add_rank_list <- function(text, labels = NULL,  input_id, ...){
  z <- list(
    text = text,
    labels = labels,
    input_id,
    ...
  )
  # assert_that(is_input_id(input_id))
  class(z) <- c("add_rank_list", "list")
  z
}

is.add_rank_list <- function(x)inherits(x, "add_rank_list")


#' Create a bucket list.
#'
#' A bucket list can contain more than one [rank_list] and allows
#' drag-and-drop of items between the different lists.
#'
#'
#' @inheritParams rank_list
#'
#' @template options
#'
#' @param header Text that appears at the top of the bucket list.  (This is
#'   encoded as an HTML `<p>` tag, so not strictly speaking a header.)
#' @param ... One or more specifications for a rank list, and must be
#'   defined by [add_rank_list].
#'
#' @param group_name Passed to `sortable.js` as the group name
#' @param group_put_max Not yet implemented
#'
#' @export
#' @example inst/examples/example_bucket_list.R
#' @examples
#' ## Example of a shiny app
#' if (interactive()) {
#'   app <- system.file("shiny-examples/bucket_list/bucket_list_app.R", package = "sortable")
#'   shiny::runApp(app)
#' }
bucket_list <- function(
  header = NULL,
  ...,
  group_name,
  group_put_max = rep(Inf, length(labels)),
  selector = NULL,
  options = sortable_options(),
  style = css_bucket_list()
) {

  # capture the dots
  dots <- list(...)
  # assert_that(is_header(header))

  for (dot in dots) {
    assert_that(is.add_rank_list(dot))
  }
  assert_that(is_sortable_options(options))
  if (missing(group_name) || is.null(group_name)) {
    group_name <- increment_bucket_group()
  }


  # modify the dots by adding the group_name to the sortable options
  mod <- lapply(seq_along(dots), function(i){
    modifyList(
      dots[[i]],
      val = list(
        options = sortable_options(group = group_name),
        style = "",
        additional_class = paste0("column_", i)
      )
    )
  })

  # construct list rank_list objects
  sortables <- lapply(seq_along(mod), function(i) do.call(rank_list, mod[[i]]) )

  z <- tagList(
    tags$div(
      class = "bucket-list",
      if (!is.null(header))tags$p(header) else NULL,
      tags$style(htmltools::HTML(style)),
      tags$div(
        class = "bucket-list-container",
        sortables
      )
    )
  )


  as.bucket_list(z)
}
