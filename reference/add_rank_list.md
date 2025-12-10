# Add a rank list inside bucket list.

Since a
[bucket_list](https://rstudio.github.io/sortable/reference/bucket_list.md)
can contain more than one
[rank_list](https://rstudio.github.io/sortable/reference/rank_list.md),
you need an easy way to define the contents of each individual rank
list. This function serves as a specification of a rank list.

## Usage

``` r
add_rank_list(text, labels = NULL, input_id = NULL, css_id = input_id, ...)
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

- ...:

  Other arguments passed to `rank_list`

## Value

A list of class `add_rank_list`

## See also

[`bucket_list()`](https://rstudio.github.io/sortable/reference/bucket_list.md),
[`rank_list()`](https://rstudio.github.io/sortable/reference/rank_list.md)
and
[`update_rank_list()`](https://rstudio.github.io/sortable/reference/update_rank_list.md)
