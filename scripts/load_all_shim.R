# Makes it easy to test the package in development by shimming `htmlwidgets`
# and `htmltools`, before `load_all()`.
#
# Solution by Winston Chang (https://gist.github.com/wch/c942335660dc6c96322f)

local({
  shim_system_file <- function(package) {
    imports <- parent.env(asNamespace(package))
    pkgload:::unlock_environment(imports)
    imports$system.file <- pkgload:::shim_system.file
  }

  shim_system_file("htmlwidgets")
  shim_system_file("htmltools")
})

devtools::load_all()
