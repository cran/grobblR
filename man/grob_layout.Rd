% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/grob_layout.R
\name{grob_layout}
\alias{grob_layout}
\title{Grob Layout}
\usage{
grob_layout(
  ...,
  height = 280,
  width = 216,
  title = "",
  title_aes_list = ga_list(),
  title_p = 0.1,
  title_height = NA_real_,
  caption = "",
  caption_aes_list = ga_list(),
  caption_p = 0.05,
  caption_height = NA_real_,
  padding_p = 0.05,
  padding = NA_real_,
  page_number = ""
)
}
\arguments{
\item{...}{The combination of grob-rows and grob-columns which will help give 
the main grob-layout outputted its structure and aesthetics.}

\item{height}{The numeric height of the grob-layout in millimeters.

Default is 280 mm - which is the height of an upright 8.5 x 11 inches piece of copy paper.}

\item{width}{The numeric width of the grob in millimeters.

Default is 216 mm - which is the width of an upright 8.5 x 11 inches piece of copy paper.}

\item{title}{A character string which will be displayed as the title of the grob-layout.}

\item{title_aes_list}{The list outputted by \code{\link{ga_list}}, which
controls aesthetics of the title of the grob-layout.}

\item{title_p}{The numeric proportion the grob-layout's height will be used by the title grob.}

\item{title_height}{The numeric height in mm within the grob-layout which will
be used by the title grob. Will override \code{title_p} if provided.}

\item{caption}{A character string which will be displayed as the caption at
the bottom of the grob-layout.}

\item{caption_aes_list}{The list outputted by \code{\link{ga_list}}, which
controls aesthetics of the caption of the grob-layout.}

\item{caption_p}{The numeric proportion of height within the grob-layout and
its allotted space which will be used by the caption grob.}

\item{caption_height}{The numeric height in mm within the grob-layout which will
be used by the caption grob. Will override \code{caption_p} if provided.}

\item{padding_p}{The proportion of the minimum of the height and width which 
will be used for the padding around the edge of the grob-layout.

Overridden by any numeric value provided in the \code{padding} parameter.}

\item{padding}{The numeric amount of padding around the edge of the grob-layout
in millimeters.}

\item{page_number}{A single value that can be converted to an integer for the
page number in the bottom right of the grob-layout within its padding.
If it cannot be converted to an integer, the page number will not appear.}
}
\value{
An R6 class object containing all information necessary to create
the overall grob-layout.
}
\description{
The main \code{grobblR} function which contains and organizes
\code{\link{grob_col}}'s and \code{\link{grob_row}}'s, giving the overall
grob-layout its shape.
}
\details{
Learn more in \code{vignette("grob_layout")}
}
\examples{

grob_layout(
  grob_row(grob_col(1, border = TRUE), grob_col(2, border = TRUE)),
  grob_row(grob_col(3, border = TRUE))
  ) \%>\%
  view_grob(100, 100)
  
}
