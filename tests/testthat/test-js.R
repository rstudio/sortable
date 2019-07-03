context("js events")


test_that( "js events can be chained ", {

  fns <- list(
    a = htmlwidgets::JS("function(a) { a  + 1 }"),
    b = htmlwidgets::JS("function(b) { b  + 3 }"),
    c = htmlwidgets::JS("function(c) { c  + 5 }")
  )

  js <- chain_js_events(
    NULL,
    fns$a,
    NULL,
    fns$b,
    fns$c,
    NULL,
    NULL
  )

  expect_equal(
    js,
    htmlwidgets::JS("function() {\n  var self = this;\n  (function(a) { a  + 1 }).apply(self, arguments);\n  (function(b) { b  + 3 }).apply(self, arguments);\n  (function(c) { c  + 5 }).apply(self, arguments);\n}") # nolint
  )

})
