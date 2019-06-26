#' Define options to pass to a sortable object.
#'
#' Use this function to define the options for [sortable_js] and [rank_list], which will pass these in turn to the `sortable.js` JavaScript library.
#'
#' Many of the `sortable.js` options will accept a JavaScript function. You can do this using the `htmlwidgets::JS` function.
#'
#'
#' @param group To drag elements from one list into another, both lists must have the same group value. See [Sortable#group-option](https://github.com/sortablejs/Sortable/#group-option) for more details. \[`"name"`\]
#' @param sort Boolean that allows sorting inside a list. \[`TRUE`\]
#' @param delay Time in milliseconds to define when the sorting should start. \[`0`\]
# ' @param delayOnTouchOnly Boolean that will only delay if user is using touch (mobile display). \[`FALSE`\]
# ' @param touchStartThreshold Number of pixels a point should move before cancelling a delayed drag event. \[`0`\]
#' @param disabled Boolean that disables the sortable if set to true. \[`FALSE`\]
# ' @param store Saving and restoring of the sort. See [Sortable#store](https://github.com/sortablejs/Sortable/#store)
#' @param animation Millisecond duration of the animation of items when sorting \[`0` (no animation)\]
# ' @param easing Easing for animation. \[`NULL`\] See [https://easings.net/](https://easings.net/) for examples.
#' @param handle CSS selector used for the drag handle selector within list items. \[`".my-handle"`\]
#' @param filter CSS selector or JS function used for elements that cannot be dragged. \[`".ignore-elements"`\]
# ' @param preventOnFilter Boolean that determines if `event.preventDefault()` is called when `filter` is triggered. \[`TRUE`\]
#' @param draggable CSS selector of which items inside the element should be draggable. \[`".item"`\]
# ' @param dataIdAttr no documentation
# ' @param ghostClass CSS class name for the drop placeholder. \[`"sortable-ghost"`\]
# ' @param chosenClass CSS class name for the chosen item \[`"sortable-chosen"`\]
# ' @param dragClass CSS class name for the dragging item \[`"sortable-drag"`\]
#' @param swapThreshold Percentage of the target that the swap zone will take up, as a number between `0` and `1`. \[`1`\]
#' @param invertSwap Set to \code{TRUE} to set the swap zone to the sides of the target, for the effect of sorting "in between" items. \[`FALSE`\]
# ' @param invertedSwapThreshold Percentage of the target that the inverted swap zone will take up, as a number between `0` and `1`. \[`swapThreshold`\]
#' @param direction Direction of Sortable \[`"horizontal"`\]
# ' @param forceFallback : false,  // ignore the HTML5 DnD behaviour and force the fallback to kick in
# ' @param fallbackClass : "sortable-fallback",  // Class name for the cloned DOM Element when using forceFallback
# ' @param fallbackOnBody : false,  // Appends the cloned DOM Element into the Document's Body
# ' @param fallbackTolerance : 0, // Specify in pixels how far the mouse should move before it's considered as a drag.
# ' @param dragoverBubble If set to true, the dragover event will bubble to parent sortables. \[`false`\]
# ' @param removeCloneOnHide: true, // Remove the clone element when it is not showing, rather than just hiding it
# ' @param emptyInsertThreshold: Number of pixels a mouse must be from empty sortable to insert drag element into it. \[`5`\]
# ' @param setData undocumented on website
# https://github.com/SortableJS/Sortable/tree/master/plugins/AutoScroll
#' @param scrollSensitivity Number of pixels the mouse needs to be to an edge to start scrolling. \[`30`\]
#' @param scrollSpeed Number of pixels for the speed of scrolling. \[`10`\]
# ' @param onChoose,onUnchoose JS function called when an element is chosen or unchosen
#' @param onStart,onEnd JS function called when an element dragging starts or ends
#' @param onAdd JS function called when an element is dropped into the list from another list
#' @param onUpdate JS function called when the sorting is changed within a list
#' @param onSort JS function called by any change to the list (add / update / remove)
#' @param onRemove JS function called when an element is removed from the list into another list
#' @param onFilter JS function called when an attempt is made to drag a filtered element
#' @param onMove JS function called when an item is moved in a list or between lists
# ' @param onClone JS function that is called when creating a clone of an element
# ' @param onChange JS function that is called when a dragging element changes position
#' @param ... other params passed onto Sortable.js
#' @references  [https://github.com/sortablejs/Sortable/](https://github.com/sortablejs/Sortable/)
#' @seealso [sortable_js]
#' @export
sortable_options <- function(
  # nolint start
  group = NULL,
  sort = NULL,
  delay = NULL,
  disabled = NULL,
  animation = NULL,
  handle = NULL,
  filter = NULL,
  draggable = NULL,
  swapThreshold = NULL,
  invertSwap = NULL,
  direction = NULL,
  scrollSensitivity = NULL,
  scrollSpeed = NULL,
  onStart = NULL,
  onEnd = NULL,
  onAdd = NULL,
  onUpdate = NULL,
  onSort = NULL,
  onRemove = NULL,
  onFilter = NULL,
  onMove = NULL,
  # nolint end
  ...
) {
  extra_args <- list(...)

  # get all names and values
  args <- names(formals(sortable_options))
  arg_vals <- mget(args[-length(args)], environment()) # remove last element (...)

  # remove null values
  is_null <- vapply(arg_vals, is.null, logical(1))
  arg_vals <- arg_vals[!is_null]

  # merge all args
  ret <- append(arg_vals, extra_args)

  class(ret) <- "sortable_options"
  ret
}



