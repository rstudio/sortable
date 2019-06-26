#' CSS stylesheet for rank list.
#'
#' This is the default CSS stylesheet for the [rank_list] function.
#'
#' @export
css_rank_list <- function(){
"
.bucket-list {
  background-color: #eee;
  padding: 10px;
  margin: 5px;
}

.bucket-list-container {
  display: flex;
  flex-direction: row;
}

.rank-list-container {
  flex: 30%;
  background-color: #ccc;
  padding: 10px;
  margin: 5px;
}

.rank-list {
  display: flex;
  flex-direction: column;
  -webkit-border-radius: 5px;
  border-radius: 5px;
  background-color: #aaa;
  padding-bottom: 5px;
  margin: 5px;
}

.rank-list-item {
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

.rank-list:empty {
  padding-bottom: 30px;
}
"
}



#' CSS stylesheet for a bucket list.
#'
#' This is the default CSS stylesheet for the [bucket_list] function.
#'
#' @export
#' @rdname css_bucket_list
css_bucket_list <- function(){
  css <- css_rank_list()

  additional_css <- "
  .rank-list {
    padding-bottom: 15px;
  }
  "
  paste(css, additional_css, sep = "\n")
}
#' @export
#' @rdname css_bucket_list
css_parsons <- function(){
  css <- css_rank_list()

  ## Insert a magrittr pipe after each list item entry, except the last, and
  ## only in column 2

  additional_css <- "
  .rank-list-container .column_2 {
    padding-bottom: 30px;
  }

  .rank-list-item {
    font-family: monospace, sant-serif;
  }
  "

  after_css <- "
  .column_2 .rank-list-item:not(:last-child):after {
    content: \" %>%\";
  }

  .column_2 .rank-list-item:not(:first-child) {
    margin-left: 30px;
  }
  "

  paste(css, additional_css, after_css, sep = "\n")
}
