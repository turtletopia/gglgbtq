% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scales.R
\name{lgbtq-scales}
\alias{lgbtq-scales}
\alias{scale_color_lgbtq}
\alias{scale_colour_lgbtq}
\alias{scale_fill_lgbtq}
\title{Apply gglgbtq scales}
\usage{
scale_color_lgbtq(values, ...)

scale_colour_lgbtq(values, ...)

scale_fill_lgbtq(values, ...)
}
\arguments{
\item{values}{\code{character(1)} \cr
Name of the flag the colors are based on.}

\item{...}{\code{ANY} \cr
Arguments passed to \code{\link[ggplot2:scale_manual]{ggplot2::scale_color_manual()}}.}
}
\value{
A scale to be used with a \pkg{ggplot2} object.
}
\description{
These functions provide a shorthand for passing \code{\link[=palette_lgbtq]{palette_lgbtq()}} to \code{values} parameter of an appropriate ggplot2
scale.
}
\examples{
data <- data.frame(
  x = 1:10, y = 15:6,
  group = rep(c("a", "b"), each = 5)
)

# Instead of specifying scale_color_manual()
ggplot2::ggplot(data, ggplot2::aes(x = x, y = y, color = group)) +
  ggplot2::geom_point(size = 4) +
  ggplot2::scale_color_manual(values = palette_lgbtq("intersex"))

# One can use scale_color_lgbtq()
ggplot2::ggplot(data, ggplot2::aes(x = x, y = y, color = group)) +
  ggplot2::geom_point(size = 4) +
  scale_color_lgbtq("intersex")

}
