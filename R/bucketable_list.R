#' Add a sortable list inside bucketable list.
#'
#' Since a [bucketable_list] can contain more than one [sortable_list], you need an easy way to define the contents of each individual sortable list.  This function serves as a specification of a sortable list.
#'
#' @inheritParams sortable_list
#' @param ... Other arguments passed to `sortable_list`
#'
#' @export
add_sortable_list <- function(text, labels, ...){
  z <- list(
    text = text,
    labels = labels,
    ...
  )
  class(z) <- c("add_sortable_list", "list")
  z
}

is.add_sortable_list <- function(x)inherits(x, "add_sortable_list")


#' Create a bucketable  list.
#'
#' A bucketable list can contain more than one [sortable_list] and allows
#' drag-and-drop of items between the different lists.
#'
#'
#' @inheritParams sortable_list
#'
#' @template options
#'
#' @param header Text that appears at the top of the bucketable list.  (This is
#'   encoded as an HTML `<p>` tag, so not strictly speaking a header.)
#' @param ... One or more specifications for a sortable list, and must be
#'   defined by [add_sortable_list].
#'
#' @param output_id Character vector of `output_id` to pass (individually) to
#'   [sortable_list]
#' @param group_name Passed to `sortable.js` as the group name
#' @param group_put_max Not yet implemented
#'
#' @export
#' @example inst/examples/example_bucketable_list.R
bucketable_list <- function(
  header,
  ...,
  output_id,
  group_name,
  group_put_max = rep(Inf, length(labels)),
  selector = NULL,
  options = sortable_options(),
  style = css_bucketable_list()
) {
  # if (is.null(selector)) {
  #   selector <- vapply(
  #     seq_along(labels),
  #     function(i) {
  #       increment_bucketable_list()
  #     },
  #     FUN.VALUE = character(1)
  #   )
  # }
  dots <- list(...)
  assertthat::is.string(header)
  assertthat::assert_that(length(header) == 1)
  for (n in dots) {assert_that(is.add_sortable_list(n))}
  assert_sortable_options(options)

  # capture the dots

  # modidy the dots by adding the group_name to the sortable options
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

  # construct list sortable_list objects
  sortables <- lapply(seq_along(mod), function(i) do.call(sortable_list, mod[[i]]) )

  z <- tagList(
    tags$div(
      class = "bucketable-list",
      tags$p(header),
      tags$style(htmltools::HTML(style)),
      tags$div(
        class = "bucketable-list-container",
        sortables
      )
    )
  )


  as.bucketable_list(z)
}

