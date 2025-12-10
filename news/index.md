# Changelog

## sortable 0.5.0.9000

### Enhancements

- New function
  [`update_bucket_list()`](https://rstudio.github.io/sortable/reference/update_bucket_list.md)
  to update the items in a bucket list
- New functionality to update `labels` in
  [`update_rank_list()`](https://rstudio.github.io/sortable/reference/update_rank_list.md)

### Updates

- Update `Sortable.js` to version 1.15.3

## sortable 0.5.0

CRAN release: 2023-03-26

### Enhancements

- Add support for
  [`update_rank_list()`](https://rstudio.github.io/sortable/reference/update_rank_list.md)
- Add ability to switch the orientation of
  [`rank_list()`](https://rstudio.github.io/sortable/reference/rank_list.md)
  items to horizontal.
  [\#92](https://github.com/rstudio/sortable/issues/92)

### Changes

- A `rank_list` now has a unique CSS id, to allow updating the `text` of
  the container.

## sortable 0.4.6

CRAN release: 2022-08-14

### Upgrade sortable.js

- Include `sortable.js` version 1.15.0

## sortable 0.4.5

CRAN release: 2021-12-13

### Upgrade sortable.js

- Include `sortable.js` version 1.14.0, as suggested by
  [\#82](https://github.com/rstudio/sortable/issues/82) and
  [\#73](https://github.com/rstudio/sortable/issues/73)

### Bug fixes

- Capture error if bucket_list header is empty
  [\#31](https://github.com/rstudio/sortable/issues/31)
- Fix rank-list-item that spills outside the container boundary
  [\#68](https://github.com/rstudio/sortable/issues/68)
- Allow bucket_list to have empty header, and capture error better
  [\#69](https://github.com/rstudio/sortable/issues/69)

### Other changes

- Upgrade tests to `testthat` version 3

## sortable 0.4.4

CRAN release: 2020-09-17

- No functional changes
- This release removes a Suggests dependency on `lifecycle` to comply
  with CRAN policy. The `lifecycle` package was not used in the project.

## sortable 0.4.3

CRAN release: 2020-08-26

### Breaking changes:

- Moved the `...` dots argument of
  [`sortable_options()`](https://rstudio.github.io/sortable/reference/sortable_options.md)
  to the first argument, where previously it was the last argument. This
  is to prevent partial name matching resulting in the incorrect
  sortable option being set.

### Other:

- Updated `sortable.js` to version 1.10.2

- Added examples for using the `sortable.js` plugins, specifically
  multiDrag and swap.

- Added vignette on cloning and removing, contributed by Maya Gans

## sortable 0.4.2

CRAN release: 2019-12-01

- First release accepted by CRAN

## sortable 0.4.0

- First candidate release to CRAN
