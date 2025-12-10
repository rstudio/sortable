# Chain multiple JavaScript events

SortableJS does not have an event based system. To be able to call
multiple JavaScript events under the same event execution, they need to
be executed one after another.

## Usage

``` r
chain_js_events(...)
```

## Arguments

- ...:

  JavaScript functions defined by
  [htmlwidgets::JS](https://rdrr.io/pkg/htmlwidgets/man/JS.html)

## Value

A single JavaScript function that will call all methods provided with
the event

## See also

Other JavaScript functions:
[`sortable_js_capture_input()`](https://rstudio.github.io/sortable/reference/sortable_js_capture_input.md)
