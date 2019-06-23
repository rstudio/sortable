#' CSS stylesheet for sortable list.
#'
#' This is the default CSS stylesheet for the [sortable_list] function.
#'
#' @export
css_sortable_list <- function(){
"
.bucketable-list {
  background-color: #eee;
  padding: 10px;
  margin: 5px;
}

.bucketable-list-container {
  display: flex;
  flex-direction: row;
}

.sortable-list-container {
  flex: 30%;
  background-color: #ccc;
  padding: 10px;
  margin: 5px;
}

.sortable-list {
  display: flex;
  flex-direction: column;
  -webkit-border-radius: 5px;
  border-radius: 5px;
  background-color: #aaa;
  padding-bottom: 5px;
  margin: 5px;
}

.sortable-list-item {
  -webkit-border-radius: 10px;
  border-radius: 10px;
  position: relative;
  display: block;
  padding: 10px 15px;
  margin: 5px 3px -1px 3px;
  background-color: #fff;
  border: 1px solid #ddd;
  overflow: hidden;
  width: fit-content;
}

.sortable-list:empty {
  padding-bottom: 30px;
}
"
}



#' CSS stylesheet for a bucketable list.
#'
#' This is the default CSS stylesheet for the [bucketable_list] function.
#'
#' @export
#' @rdname css_bucketable_list
css_bucketable_list <- function(){
  css <- css_sortable_list()

  additional_css <- "
  .sortable-list {
    padding-bottom: 15px;
  }
  "
  paste(css, additional_css, sep = "\n")
}
#' @export
#' @rdname css_bucketable_list
css_parsons <- function(){
  css <- css_sortable_list()

  ## Insert a magrittr pipe after each list item entry, except the last, and
  ## only in column 2

  additional_css <- "
  .sortable-list-container .column_2 {
    padding-bottom: 30px;
  }

  .sortable-list-item {
    font-family: monospace, sant-serif;
  }
  "

  after_css <- "
  .column_2 .sortable-list-item:not(:last-child):after {
    content: \" %>%\";
  }

  .column_2 .sortable-list-item:not(:first-child) {
    margin-left: 30px;
  }
  "

  paste(css, additional_css, after_css, sep = "\n")
}
