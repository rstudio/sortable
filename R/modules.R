# TODO: Create demo app with modules
# TODO: Ensure module settings for id gets passed to JavaScript binding

# create environment for storing shiny module status
sortable_env = new.env()
sortable_env$modules = FALSE

#' Check if shiny modules are enabled for `sortable`.
#'
#' Due to an early (regrettable) design decision, `sortable` in versions <= 0.5.0
#' did not support shiny modules.
#' To use `sortable` with shiny modules, you have to opt in to different
#' behaviour, by calling `enable_modules()`.
#'
#' @rdname modules
#' @return Logical value indicating whether shiny modules are enabled or not.
#' @export
is_modules_enabled <- function(){
  isTRUE(sortable_env$modules)
}

#' @rdname modules
#' @param enable If `TRUE`, enables modules. If `FALSE` disables them.
#' @export
enable_modules <- function(enable = TRUE){
  assertthat::assert_that(is.logical(enable))
  sortable_env$modules = enable
  is_modules_enabled()
}
