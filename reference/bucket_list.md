# Create a bucket list.

A bucket list can contain more than one
[rank_list](https://rstudio.github.io/sortable/reference/rank_list.md)
and allows drag-and-drop of items between the different lists.

## Usage

``` r
bucket_list(
  header = NULL,
  ...,
  group_name,
  css_id = group_name,
  group_put_max = rep(Inf, length(labels)),
  options = sortable_options(),
  class = "default-sortable",
  orientation = c("horizontal", "vertical")
)
```

## Arguments

- header:

  Text that appears at the top of the bucket list. (This is encoded as
  an HTML `<p>` tag, so not strictly speaking a header.) Note that you
  must explicitly provide `header` argument, especially in the case
  where you want the header to be empty - to do this use `header = NULL`
  or `header = NA`.

- ...:

  One or more specifications for a rank list, and must be defined by
  [add_rank_list](https://rstudio.github.io/sortable/reference/add_rank_list.md).

- group_name:

  Passed to `SortableJS` as the group name. Also the input value set in
  Shiny. (`input[[group_name]]`). Items can be dragged between bucket
  lists which share the same group name.

- css_id:

  This is the css id to use, and must be unique in your shiny app. This
  defaults to the value of `group_id`, and will be appended to the value
  "bucket-list-container", to ensure the CSS id is unique for the
  container as well as the embedded rank lists.

- group_put_max:

  Not yet implemented

- options:

  Options to be supplied to
  [sortable_js](https://rstudio.github.io/sortable/reference/sortable_js.md)
  object. See
  [sortable_options](https://rstudio.github.io/sortable/reference/sortable_options.md)
  for more details

- class:

  A css class applied to the bucket list and rank lists. This can be
  used to define custom styling.

- orientation:

  Either `horizontal` or `vertical`, and specifies the layout of the
  components on the page.

## Value

A list with class `bucket_list`

## See also

[rank_list](https://rstudio.github.io/sortable/reference/rank_list.md),
[update_rank_list](https://rstudio.github.io/sortable/reference/update_rank_list.md)

## Examples

``` r
## -- example-bucket-list ---------------------------------------------

## bucket list

if(interactive()) {
  bucket_list(
    header = "This is a bucket list. You can drag items between the lists.",
    add_rank_list(
      text = "Drag from here",
      labels = c("a", "bb", "ccc")
    ),
    add_rank_list(
      text = "to here",
      labels = NULL
    )
  )
}

## bucket list with three columns

if(interactive()) {
  bucket_list(
    header = c("Sort these items into Letters and Numbers"),
    add_rank_list(
      text = "Drag from here",
      labels = sample(c(1:3, letters[1:2]))
    ),
    add_rank_list(
      text = "Letters"
    ),
    add_rank_list(
      text = "Numbers"
    )
  )
}

## drag items between bucket lists

if(interactive()) {

  ui <- shiny::fluidPage(
    shiny::column(4, bucket_list(NULL,
      group_name = "foo",
      add_rank_list(
        text = "Drag from here...",
        labels = sample(c(1:3, letters[1:2]))
      )
    )),
    shiny::column(4, "Some empty space"),
    shiny::column(4, bucket_list(NULL,
      group_name = "foo",
      add_rank_list(
        text = "...To here"
      )
    ))
  )

  server <- function(input, output, session) {}

  shiny::shinyApp(ui, server)


}

## Example of a shiny app
if (interactive()) {
  app <- system.file(
    "shiny/bucket_list/app.R",
    package = "sortable"
  )
  shiny::runApp(app)
}
```
