## Developer scripts

All script should be run from the root directory, such as `source("scripts/compile_css.R")`.


* `load_all_shim.R`
  * Adds a shim to source local htmlwidget files and calls `devtools::load_all()`

* `compile_css.R`
  * Compiles all Sass code into css

* `deploy_apps.R`
  * Deploys all shiny application examples to shinyapps.io
  * Deploys all learnr tutorials to shinyapps.io

* `deploy_apps.R`
  * Calls `deploy_apps.R`
  * Called within Travis-CI.

* `download_sortablejs.R`
  * Downloads a `sortable.js` file and updates the appropriate versions

* `build_docs.R`
  * Build the README.Rmd
  * Installs the pkg to avoid docs issues
  * Build the pkgdocs locally (which is `.gitignore`'d)
