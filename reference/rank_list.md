# Create a ranking item list.

Creates a ranking item list using the `SortableJS` framework, and
generates an `htmlwidgets` element. The elements of this list can be
dragged and dropped in any order.

You can embed a ranking question inside a `learnr` tutorial, using
[`question_rank()`](https://rstudio.github.io/sortable/reference/question_rank.md).

To embed a `rank_list` inside a shiny app, see the Details section.

## Usage

``` r
rank_list(
  text = "",
  labels,
  input_id,
  css_id = input_id,
  options = sortable_options(),
  orientation = c("vertical", "horizontal"),
  class = "default-sortable"
)
```

## Arguments

- text:

  Text to appear at top of list.

- labels:

  A character vector with the text to display inside the widget. This
  can also be a list of html tag elements. The text content of each
  label or label name will be used to set the shiny `input_id` value. To
  create an empty `rank_list`, use `labels = list()`.

- input_id:

  output variable to read the plot/image from.

- css_id:

  This is the css id to use, and must be unique in your shiny app. This
  defaults to the value of `input_id`, and will be appended to the value
  "rank-list-container", to ensure the CSS id is unique for the
  container as well as the labels. If NULL, the function generates an id
  of the form `rank_list_id_1`, and will automatically increment for
  every `rank_list`.

- options:

  Options to be supplied to
  [sortable_js](https://rstudio.github.io/sortable/reference/sortable_js.md)
  object. See
  [sortable_options](https://rstudio.github.io/sortable/reference/sortable_options.md)
  for more details

- orientation:

  Set this to "horizontal" to get horizontal orientation of the items.

- class:

  A css class applied to the rank list. This can be used to define
  custom styling.

## Details

You can embed a `rank_list` inside a Shiny app, to capture the preferred
ranking order of your user.

The widget automatically updates a Shiny output, with the matching
`input_id`.

## See also

[update_rank_list](https://rstudio.github.io/sortable/reference/update_rank_list.md),
[sortable_js](https://rstudio.github.io/sortable/reference/sortable_js.md),
[bucket_list](https://rstudio.github.io/sortable/reference/bucket_list.md)
and
[question_rank](https://rstudio.github.io/sortable/reference/question_rank.md)

## Examples

``` r
## - example-rank-list ------------------------------------------------

if (interactive()) {
  rank_list(
    text = "You can drag, drop and re-order these items:",
    labels = c("one", "two", "three", "four", "five"),
    input_id = "example_2"
  )
}
## - example-rank-list-multidrag ------------------------------------------

if (interactive()) {
  rank_list(
    text = "You can select multiple items and drag as a group:",
    labels = c("one", "two", "three", "four", "five"),
    input_id = "example_2",
    options = sortable_options(
      multiDrag = TRUE
    )
  )
}
## - example-rank-list-swap -----------------------------------------------

if (interactive()) {
  rank_list(
    text = "You can re-order these items, and notice the swapping behaviour:",
    labels = c("one", "two", "three", "four", "five"),
    input_id = "example_2",
    options = sortable_options(
      swap = TRUE
    )
  )
}
## Example of a shiny app
if (interactive()) {
  app <- system.file("shiny/rank_list/app.R", package = "sortable")
  shiny::runApp(app)
}
```
