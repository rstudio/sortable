% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/js.R
\name{chain_js_events}
\alias{chain_js_events}
\title{Chain multiple JavaScript events}
\usage{
chain_js_events(...)
}
\arguments{
\item{...}{JavaScript functions defined by \link[htmlwidgets:JS]{htmlwidgets::JS}}
}
\value{
A single JavaScript function that will call all methods provided with
the event
}
\description{
SortableJS does not have an event based system.  To be able to call multiple
JavaScript events under the same event execution, they need to be executed
one after another.
}
\seealso{
Other JavaScript functions: 
\code{\link{sortable_js_capture_input}()}
}
\concept{JavaScript functions}
