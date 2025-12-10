# Widget render function for use in Shiny.

Widget render function for use in Shiny.

## Usage

``` r
render_sortable(expr, env = parent.frame(), quoted = FALSE)
```

## Arguments

- expr:

  An expression

- env:

  The environment in which to evaluate `expr`.

- quoted:

  Is `expr` a quoted expression (with
  [`quote()`](https://rdrr.io/r/base/substitute.html))? This is useful
  if you want to save an expression in a variable.
