% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/headings.R
\name{add_column_headings}
\alias{add_column_headings}
\title{Add column headings to grob matrix}
\usage{
add_column_headings(mat, headings = list(), heading_cols = list())
}
\arguments{
\item{mat}{The grob matrix object the column headings will be added onto.}

\item{headings}{The headings to be added onto the initial matrix, 
in a list with each heading a separate element. The list must have
the same amount of elements as the \code{heading_cols} parameter.}

\item{heading_cols}{Which column positions of the initial matrix the \code{headings} 
will be placed above, in a list with each heading's column positions a separate element. 
The list must have the same amount of elements as the \code{headings} parameter.

Can either be numeric indices, or column names of the initial data frame / matrix
passed through \code{\link{grob_matrix}}.

Default is an empty list. If unaltered, the function will assume the user
wants to apply \code{headings} to all columns of the \code{\link{grob_matrix}} - 
in which case only one \code{headings} is allowed.}
}
\value{
The initial grob matrix object with column headings inserted into the
appropriate areas.
}
\description{
Add column headings onto an object initialized by \code{\link{grob_matrix}}.
}
\details{
The user must add column headings \strong{before} adding or altering
any aesthetics.
}
\examples{

data.frame(var1 = c(5, 14, 6, 10), var2 = c(3, 30, 17, 7)) \%>\%
  grob_matrix() \%>\% 
  add_column_headings(c('HEADING')) \%>\%
  view_grob()

}
