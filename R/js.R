get_child_id_or_text_js_fn <- function() {
  paste0(collapse = "\n",
    "function(child) {",
    # make child a jquery element
    "  var child_ = $(child);",
    "  var children = child_.children();",
    #  if there are children elements
    "  if (children.length > 0) {",
    #    get the first child and check it's id
    "    var id = $(children.get(0)).attr('id');",
    #    if there is an id, return it
    "    if (id) return(id);",
    "  }",
    #  otherwise return the inner text of the element
    "  return $.trim(child_.text());",
    "}"
  )
}


#' Construct JavaScript method to capture Shiny inputs on change.
#'
#' This captures the state of a `sortable` list.  It will look for an `id` attribute of the first child for each element.  If not attribute exists for that particular item's first child, the inner text will be used as an identifier.
#'
#' This method is used with the `onSort` option of `sortable_js`. See [sortable_options()].
#'
#' @param input_id Shiny input name to set
#'
#' @seealso [sortable_js] and [rank_list].
#'
#' @rdname sortable_js_capture_input
#' @export
#' @examples
#' # For an example, see the Shiny app at
#' system.file("shiny-examples/drag_vars_to_plot/app.R", package = "sortable")
sortable_js_capture_input <- function(input_id) {
  # can call jquery as shiny will always have jquery
  inner_text <- paste0(
    "$.map(",
    "  this.el.children, ",
    get_child_id_or_text_js_fn(),
    ")",
    collapse = "\n"
  )
  js_text <- "function(evt) {
  if (typeof Shiny !== \"undefined\") {
    Shiny.setInputValue(\"%s:sortablejs.rank_list\", %s)
  }
}"

  js <- sprintf(js_text, input_id, inner_text)

  htmlwidgets::JS(js)
}


#' @rdname sortable_js_capture_input
#' @param input_ids Set of Shiny input ids to set corresponding to the provided `selectors`
#' @param selectors Set of SortableJS selector values to help retrieve all to set as an object
#' @export
sortable_js_capture_bucket_input <- function(input_id, input_ids, selectors) {
  assert_that(length(input_ids) > 0)
  assert_that(length(input_ids) == length(selectors))

  # can use jquery as shiny will have jquery
  js_text <- "function(evt) {
  if (typeof Shiny == \"undefined\") {
    return;
  }

  var child_id_or_text_fn = %s;

  var ret = {}, i;
  var selectors = %s;
  var input_ids = %s;

  $.map(selectors, function(selector, i) {
    var input_id = input_ids[i];
    var item = $('#' + selector).get(0);
    if (item && item.children) {
      ret[input_id] = $.map(item.children, child_id_or_text_fn);
    } else {
      ret[input_id] = undefined;
    }
  });
  Shiny.setInputValue(\"%s:sortablejs.bucket_list\", ret)
}"

  js <- sprintf(
    js_text,
    get_child_id_or_text_js_fn(),
    as.character(jsonlite::toJSON(as.list(selectors))),
    as.character(jsonlite::toJSON(as.list(input_ids))),
    input_id
  )

  htmlwidgets::JS(js)
}


#' Chain multiple JavaScript events
#'
#' SortableJS does not have an event based system.  To be able to call multiple JavaScript events under the same event execution, they need to be executed one after another.
#'
#' @param ... JavaScript functions defined by [htmlwidgets::JS]
#' @return A single JavaScript function that will call all methods provided with the event
chain_js_events <- function(...) {

  fns <- list(...)
  fns <- fns[!vapply(fns, is.null, logical(1))]
  fns <- lapply(fns, as.character)

  if (length(fns) == 1) {
    return(htmlwidgets::JS(fns[[1]]))
  }

  js_text <- collapse(
    # do not provide arguments to avoid confusion
    "function() {",
    # call fns with all arguments supplied to outer func
    # some event methods have more than one argument (most have 1).
    collapse(
      "  try {",
      rep("    (%s).apply(this, arguments);", length(fns)),
      "  } catch(e) {",
      "    if (window.console && window.console.error) window.console.error(e);",
      "  }",
      collapse = "\n\n"
    ),
    "}"
  )

  js <- do.call(sprintf, c(js_text, fns))

  htmlwidgets::JS(js)
}


collapse <- function(..., sep = "\n", collapse = "\n") {
  paste(..., sep = sep, collapse = collapse)
}
