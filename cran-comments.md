## Response to CRAN request

This release removes a Suggests dependency on `lifecycle` to comply with CRAN
policy.  The `lifecycle` package was not used in the project, so we removed the
Suggests dependency.


## Test environments

* local Windows install, R-4.0.2 and R-devel
* ubuntu 16.04 (on travis-ci), R-release, R-dev and R-old-release
* win-builder (devel and release)

