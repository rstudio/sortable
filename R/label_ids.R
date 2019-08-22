

label_ids <- function(labels) {

  nms <- names(labels)
  if (is.null(nms)) {
    return(rep("", length(labels)))
  }

  nms[is.na(nms)] <- ""
  nms
}
