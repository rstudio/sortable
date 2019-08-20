

label_ids <- function(labels) {

  nms <- names(labels)
  if (is.null(nms)) {
    return(rep("", length(labels)))
  }

  vapply(
    FUN.VALUE = character(1),
    USE.NAMES = FALSE,
    nms,
    function(name) {
      if (is.na(name)) {
        ""
      } else {
        name
      }
    }
  )

}
