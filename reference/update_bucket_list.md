# Change the value of a bucket list.

You can only update the `header` of the `bucket_list`. To update any of
the labels or rank list text, use
[`update_rank_list()`](https://rstudio.github.io/sortable/reference/update_rank_list.md)
instead.

## Usage

``` r
update_bucket_list(
  css_id,
  header = NULL,
  session = shiny::getDefaultReactiveDomain()
)
```

## Arguments

- css_id:

  This is the css id to use, and must be unique in your shiny app. This
  defaults to the value of `group_id`, and will be appended to the value
  "bucket-list-container", to ensure the CSS id is unique for the
  container as well as the embedded rank lists.

- header:

  Text that appears at the top of the bucket list. (This is encoded as
  an HTML `<p>` tag, so not strictly speaking a header.) Note that you
  must explicitly provide `header` argument, especially in the case
  where you want the header to be empty - to do this use `header = NULL`
  or `header = NA`.

- session:

  The `session` object passed to function given to `shinyServer`.

## See also

[bucket_list](https://rstudio.github.io/sortable/reference/bucket_list.md),
[update_rank_list](https://rstudio.github.io/sortable/reference/update_rank_list.md)

## Examples

``` r
## Example of a shiny app that updates a bucket list and rank list
if (interactive()) {
  app <- system.file(
    "shiny/update/app.R",
    package = "sortable"
  )
  shiny::runApp(app)
}
```
