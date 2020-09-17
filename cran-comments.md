## Response to CRAN request

This release removes a Suggests dependency on `lifecycle` to comply with CRAN
policy.  The `lifecycle` package was not used in the project, so we removed the
Suggests dependency.



## Test environments

* local Windows install, R 3.6.1
* ubuntu 16.04 (on travis-ci), R-release, R-dev and R-old-release
* win-builder (devel and release)

## R CMD check results

On Solaris there are two Warnings.  We've traced this to the fact that 
phantom.js isn't available on that platform.  I now test for the correct 
platform, and this should deal with the issue.
