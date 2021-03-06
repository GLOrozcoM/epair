% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/call_placement.R
\name{perform.call.raw}
\alias{perform.call.raw}
\title{Perform call and keep original result}
\usage{
perform.call.raw(endpoint, variables = list())
}
\arguments{
\item{endpoint}{An endpoint from the available EPA API endpoints}

\item{variables}{A list of variables or a single variable to filter the EPA API endpoint.}

\item{name}{Specifies the name each variable should have when placed in the URL. User input
is not necessary and should be left in default state.}
}
\value{
A list containing result from query to EPA API
}
\description{
Perform call and keep original result
}
\examples{
\dontrun{
endpoint <- 'list/states'
result <- perform.call.raw(endpoint)
}
}
