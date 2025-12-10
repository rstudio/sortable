# Check if shiny modules are enabled for `sortable`.

Due to an early (regrettable) design decision, `sortable` in versions
\<= 0.5.0 did not support shiny modules. To use `sortable` with shiny
modules, you have to opt in to different behaviour, by calling
`enable_modules()`.

## Usage

``` r
is_modules_enabled()

enable_modules(enable = TRUE)
```

## Arguments

- enable:

  If `TRUE`, enables modules. If `FALSE` disables them.

## Value

Logical value indicating whether shiny modules are enabled or not.
