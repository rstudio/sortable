# Creates an htmlwidget with embedded 'SortableJS' library.

Creates an `htmlwidget` that provides
[SortableJS](https://github.com/SortableJS/Sortable) to use for
drag-and-drop interactivity in Shiny apps and R Markdown.

## Usage

``` r
sortable_js(
  css_id,
  options = sortable_options(),
  width = 0,
  height = 0,
  elementId = NULL,
  preRenderHook = NULL
)
```

## Arguments

- css_id:

  `String` css_id id on which to apply `SortableJS`. Note, `sortable_js`
  works with any html element, not just `ul/li`.

- options:

  Options to be supplied to sortable_js object. See
  [sortable_options](https://rstudio.github.io/sortable/reference/sortable_options.md)
  for more details

- width:

  Fixed width for widget (in css units). The default is `NULL`, which
  results in intelligent automatic sizing based on the widget's
  container.

- height:

  Fixed height for widget (in css units). The default is `NULL`, which
  results in intelligent automatic sizing based on the widget's
  container.

- elementId:

  Use an explicit element ID for the widget (rather than an
  automatically generated one). Useful if you have other JavaScript that
  needs to explicitly discover and interact with a specific widget
  instance.

- preRenderHook:

  A function to be run on the widget, just prior to rendering. It
  accepts the entire widget object as input, and should return a
  modified widget object.

## See also

[`sortable_options()`](https://rstudio.github.io/sortable/reference/sortable_options.md)

## Examples

``` r
## -- example-sortable-js -------------------------------------------------
# Simple example of sortable_js.
# Important: set the tags CSS `id` equal to the sortable_js `css_id`

if (interactive()) {
  if (require(htmltools)) {
    html_print(
      tagList(
        tags$p("You can drag and reorder the items in this list:"),
        tags$ul(
          id = "example_1",
          tags$li("Move"),
          tags$li("Or drag"),
          tags$li("Each of the items"),
          tags$li("To different positions")
        ),
        sortable_js(css_id = "example_1")
      )
    )
  }
}
```
