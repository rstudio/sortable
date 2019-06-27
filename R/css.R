#' CSS stylesheets.
#'
#' These functions provide cascading style sheets (CSS) for:
#' * `css_rank_list()` : [rank_list()]
#' * `css_bucket_list()` : [bucket_list()]
#'
#' @rdname css
#'
#' @return Each of these functions return a character string with valid CSS.
#'
#' @examples
#' cat(
#'   css_bucket_list()
#' )
#'
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



#' @export
#' @rdname css
css_bucket_list <- function(){
  css <- css_rank_list()

  additional_css <- "
  .rank-list {
    padding-bottom: 15px;
  }
  "
  paste(css, additional_css, sep = "\n")
}
