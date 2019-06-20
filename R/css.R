#' CSS stylesheet for sortable list.
#'
#' This is the default CSS stylesheet for the [sortable_list] function.
#'
#' @export
css_sortable_list <- function(){'
  .bucketable-list-container {
    display: flex;
    flex-direction: row;
    background-color: #eee;
  }

  .sortable-list-container {
    flex: 30%;
    padding: 10px;
    background-color: #ccc;
    margin: 5px;
  }

  .sortable-list {
    display: flex;
    flex-direction: column;
    background-color: #aaa;
    padding-bottom: 30px;
    margin: 10px;
  }

  .sortable-list-item {
    -webkit-border-radius: 10px;
    border-radius: 10px;
    position: relative;
    display: block;
    padding: 10px 15px;
    margin: 5px 2px -1px 2px;
    background-color: #fff;
    border: 1px solid #ddd;
    overflow: hidden;
  }

  .sortable-list:empty {
    padding-bottom: 30px;
  }
'}

#' CSS stylesheet for sortable list.
#'
#' This is the default CSS stylesheet for the [sortable_list] function.
#'
#' @export
css_parsons_problem <- function(){
  css <- css_sortable_list()

  ## this works:
  after_css <- '
  .column_2 .sortable-list-item:not(:last-child):after {
    content: " %>% ";
  }
  '

  paste(css, after_css, sep = "\n")
}

    # .sortable-list:(:last-child):after  {

