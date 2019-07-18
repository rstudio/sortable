#' Construct JavaScript method to capture Shiny inputs on change.
#'
#' This captures the state of a `sortable` list.  Typically you would use this
#' with the `onSort` option of `sortable_js`. See [sortable_options()].
#'
#' @param input_id Shiny input name to set
#'
#' @seealso [sortable_js] and [rank_list].
#'
#' @rdname sortable_js_capture_input
#' @export
#' @examples
#' # For an example, see the Shiny app at
#' system.file("shiny-examples/drag_vars_to_plot/drag_vars_to_plot_app.R", package = "sortable")
sortable_js_capture_input <- function(input_id) {
  # can call jquery as shiny will always have jquery
  inner_text <- "$.map(this.el.children, function(child){return child.innerText})"
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

  var ret = {}, i;
  var selectors = %s;
  var input_ids = %s;

  $.map(selectors, function(selector, i) {
    var input_id = input_ids[i];
    var item = $('#' + selector).get(0);
    if (item && item.children) {
      ret[input_id] = $.map(item.children, function(child) {
        return child.innerText;
      });
    } else {
      ret[input_id] = undefined;
    }
  });
  Shiny.setInputValue(\"%s:sortablejs.bucket_list\", ret)
}"

  js <- sprintf(
    js_text,
    base::toString(jsonlite::toJSON(selectors)),
    base::toString(jsonlite::toJSON(input_ids)),
    input_id
  )

  htmlwidgets::JS(js)
}


as_character_vector <- function(x) {
  # works for both x = NULL and x = list()
  if (length(x) == 0) {
    return(character(0))
  }
  unlist(x)
}
# remove handler if it already exists. (Most likely a no-op. Here for dev purposes)
shiny::removeInputHandler("sortablejs.rank_list")
# Register a handler for a bucket_list to unlist each set of values.
# should return a list of character vectors or NULL
shiny::registerInputHandler("sortablejs.rank_list", function(val, shinysession, name) {
  ret <- as_character_vector(val)
  ret
})

# remove handler if it already exists. (Most likely a no-op. Here for dev purposes)
shiny::removeInputHandler("sortablejs.bucket_list")
# Register a handler for a bucket_list to unlist each set of values.
# should return a list of character vectors or NULL
shiny::registerInputHandler("sortablejs.bucket_list", function(val, shinysession, name) {
  ret <- lapply(val, function(x) {
    as_character_vector(x)
  })
  ret
})


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
