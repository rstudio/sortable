# Change the text or labels of a rank list.

Change the text or labels of a rank list.

## Usage

``` r
update_rank_list(
  css_id,
  text = NULL,
  labels = NULL,
  session = shiny::getDefaultReactiveDomain()
)
```

## Arguments

- css_id:

  This is the css id to use, and must be unique in your shiny app. This
  defaults to the value of `input_id`, and will be appended to the value
  "rank-list-container", to ensure the CSS id is unique for the
  container as well as the labels. If NULL, the function generates an id
  of the form `rank_list_id_1`, and will automatically increment for
  every `rank_list`.

- text:

  Text to appear at top of list.

- labels:

  A character vector with the text to display inside the widget. This
  can also be a list of html tag elements. The text content of each
  label or label name will be used to set the shiny `input_id` value. To
  create an empty `rank_list`, use `labels = list()`.

- session:

  The `session` object passed to function given to `shinyServer`.

## See also

[rank_list](https://rstudio.github.io/sortable/reference/rank_list.md)

## Examples

``` r
## Example of a shiny app that updates a bucket list and rank list
if (interactive()) {
  app <- system.file(
    "shiny/update_rank_list/app.R",
    package = "sortable"
  )
  shiny::runApp(app)
}
```
