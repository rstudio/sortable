# Makes it easy to test the package in development by shimming `htmlwidgets`
# and `htmltools`, before `load_all()`.
#
# Solution modified from Winston Chang
# (https://gist.github.com/wch/c942335660dc6c96322f)

local({

  shim_system_file <- function(package) {
    imports <- parent.env(asNamespace(package))
    pkgload:::unlock_environment(imports)
    imports$system.file <- pkgload:::shim_system.file
  }

  desc <- here::here("DESCRIPTION")
  if (file.exists(desc)) {

    pkgs <- desc::desc_get_deps()$package

    if ("htmlwidgets" %in% pkgs) {
      message("shimming htmlwidgets")
      shim_system_file("htmlwidgets")

    }
    if ("htmltools" %in% pkgs) {
      message("shimming htmltools")
      shim_system_file("htmltools")
    }
  }

  # devtools::load_all()

})

