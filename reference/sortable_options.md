# Define options to pass to a sortable object.

Use this function to define the options for
[sortable_js](https://rstudio.github.io/sortable/reference/sortable_js.md)
and
[rank_list](https://rstudio.github.io/sortable/reference/rank_list.md),
which will pass these in turn to the `SortableJS` JavaScript library.

## Usage

``` r
sortable_options(
  ...,
  swap = NULL,
  multiDrag = NULL,
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
  onLoad = NULL
)
```

## Arguments

- ...:

  other arguments passed onto `SortableJS`

- swap:

  If `TRUE`, modifies the behaviour of `sortable` to allow for items to
  be swapped with each other rather than sorted. Once dragging starts,
  the user can drag over other items and there will be no change in the
  elements. However, the item that the user drops on will be swapped
  with the originally dragged item. See also
  https://github.com/SortableJS/Sortable/tree/master/plugins/Swap

- multiDrag:

  If `TRUE`, allows the selection of multiple items within a `sortable`
  at once, and drag them as one item. Once placed, the items will unfold
  into their original order, but all beside each other at the new
  position. See also
  https://github.com/SortableJS/Sortable/wiki/Dragging-Multiple-Items-in-Sortable

- group:

  To drag elements from one list into another, both lists must have the
  same group value. See
  [Sortable#group-option](https://github.com/sortablejs/Sortable/#group-option)
  for more details. \[`"name"`\]

- sort:

  Boolean that allows sorting inside a list. \[`TRUE`\]

- delay:

  Time in milliseconds to define when the sorting should start. \[`0`\]

- disabled:

  Boolean that disables the `sortable` if set to true. \[`FALSE`\]

- animation:

  Millisecond duration of the animation of items when sorting \[`0` (no
  animation)\]

- handle:

  CSS selector used for the drag handle selector within list items.
  \[`".my-handle"`\]

- filter:

  CSS selector or JS function used for elements that cannot be dragged.
  \[`".ignore-elements"`\]

- draggable:

  CSS selector of which items inside the element should be draggable.
  \[`".item"`\]

- swapThreshold:

  Percentage of the target that the swap zone will take up, as a number
  between `0` and `1`. \[`1`\]

- invertSwap:

  Set to `TRUE` to set the swap zone to the sides of the target, for the
  effect of sorting "in between" items. \[`FALSE`\]

- direction:

  Direction of `sortable` \[`"horizontal"`\]

- scrollSensitivity:

  Number of pixels the mouse needs to be to an edge to start scrolling.
  \[`30`\]

- scrollSpeed:

  Number of pixels for the speed of scrolling. \[`10`\]

- onStart, onEnd:

  JS function called when an element dragging starts or ends

- onAdd:

  JS function called when an element is dropped into the list from
  another list

- onUpdate:

  JS function called when the sorting is changed within a list

- onSort:

  JS function called by any change to the list (add / update / remove)

- onRemove:

  JS function called when an element is removed from the list into
  another list

- onFilter:

  JS function called when an attempt is made to drag a filtered element

- onMove:

  JS function called when an item is moved in a list or between lists

- onLoad:

  JS function dispatched on the "next tick" after SortableJS has
  initialized

## Value

A list with class `sortable_options`

## Details

Many of the `SortableJS` options will accept a JavaScript function. You
can do this using the
[`htmlwidgets::JS`](https://rdrr.io/pkg/htmlwidgets/man/JS.html)
function.

## References

<https://github.com/sortablejs/Sortable/>

## See also

[sortable_js](https://rstudio.github.io/sortable/reference/sortable_js.md)

## Examples

``` r
sortable_options(sort = FALSE)
#> $sort
#> [1] FALSE
#> 
#> attr(,"class")
#> [1] "sortable_options"
```
