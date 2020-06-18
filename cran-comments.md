## Response to CRAN review

This is a comparatively minor update of the package.

## Test environments

* local Windows install, R 3.6.1
* ubuntu 16.04 (on travis-ci), R-release, R-dev and R-old-release
* win-builder (devel and release)

## R CMD check results

On Solaris there are two Warnings.  We've traced this to the fact that 
phantom.js isn't available on that platform.  I now test for the correct 
platform, and this should deal with the issue.
