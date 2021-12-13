# sortable 0.4.5

## Upgrade sortable.js

* Include `sortable.js` version 1.14.0, as suggested by #82 and #73

## Bug fixes

* Capture error if bucket_list header is empty #31
* Fix rank-list-item that spills outside the container boundary #68
* Allow bucket_list to have empty header, and capture error better #69

## Other changes

* Upgrade tests to `testthat` version 3


# sortable 0.4.4

* No functional changes
* This release removes a Suggests dependency on `lifecycle` to comply with CRAN
policy.  The `lifecycle` package was not used in the project.

# sortable 0.4.3

## Breaking changes:

* Moved the `...` dots argument of `sortable_options()` to the first argument,
where previously it was the last argument. This is to prevent partial name
matching resulting in the incorrect sortable option being set.

## Other:

* Updated `sortable.js` to version 1.10.2

* Added examples for using the `sortable.js` plugins, specifically multiDrag and
swap.

* Added vignette on cloning and removing, contributed by Maya Gans


# sortable 0.4.2

* First release accepted by CRAN


# sortable 0.4.0

* First candidate release to CRAN
