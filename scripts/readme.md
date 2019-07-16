## Developer scripts

All script should be run from the root directory, such as `source("scripts/compile_css.R")`.


* `load_all_shim.R`
  * Adds a shim to source local htmlwidget files and calls `devtools::load_all()`

* `compile_css.R`
  * Compiles all Sass code into css

* `deploy_shiny_apps.R`
  * Deploys all shiny application examples to shinyapps.io
  * Called within Travis-CI.

* `deploy_tutorial.R`
  * Deploys all `learnr` tutorials to shinyapps.io
  * Called within Travis-CI.


* `download_sortablejs.R`
  * Downloads a `sortable.js` file and updates the appropriate versions
