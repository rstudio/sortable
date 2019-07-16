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
    htmlwidgets::JS("function() {
  try {
    (function(a) { a  + 1 }).apply(this, arguments);
  } catch(e) {
    if (window.console && window.console.error) window.console.error(e);
  }

  try {
    (function(b) { b  + 3 }).apply(this, arguments);
  } catch(e) {
    if (window.console && window.console.error) window.console.error(e);
  }

  try {
    (function(c) { c  + 5 }).apply(this, arguments);
  } catch(e) {
    if (window.console && window.console.error) window.console.error(e);
  }
}")
  )


  js <- chain_js_events(
    NULL,
    fns$a,
    NULL
  )
  expect_equal(
    js, fns$a
  )

})
