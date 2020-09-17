# sortable 0.4.4 (Release date 2020-09-17)

* No functional changes
* This release removes a Suggests dependency on `lifecycle` to comply with CRAN
policy.  The `lifecycle` package was not used in the project.

# sortable 0.4.3 (Release date 2020-08-22)

Breaking changes:

* Moved the `...` dots argument of `sortable_options()` to the first argument,
where previously it was the last argument. This is to prevent partial name
matching resulting in the incorrect sortable option being set.

Other:

* Updated `sortable.js` to version 1.10.2

* Added examples for using the `sortable.js` plugins, specifically multiDrag and
swap.

* Added vignette on cloning and removing, contributed by Maya Gans


# sortable 0.4.2 (Release date 2019-11-28)

* First release accepted by CRAN


# sortable 0.4.0 (Release date 2019-11-10)

* First candidate release to CRAN
