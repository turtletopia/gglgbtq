#' Apply gglgbtq scales
#'
#' @description
#' These functions provide a shorthand for passing [palette_lgbtq()] to `values` parameter of an appropriate ggplot2
#' scale.
#'
#' @param values `character(1)` \cr
#'  Name of the flag the colors are based on.
#' @param ... `ANY` \cr
#'  Arguments passed to [ggplot2::scale_color_manual()].
#'
#' @return A scale to be used with a \pkg{ggplot2} object.
#'
#' @examples
#' data <- data.frame(
#'   x = 1:10, y = 15:6,
#'   group = rep(c("a", "b"), each = 5)
#' )
#'
#' # Instead of specifying scale_color_manual()
#' ggplot2::ggplot(data, ggplot2::aes(x = x, y = y, color = group)) +
#'   ggplot2::geom_point(size = 4) +
#'   ggplot2::scale_color_manual(values = palette_lgbtq("intersex"))
#'
#' # One can use scale_color_lgbtq()
#' ggplot2::ggplot(data, ggplot2::aes(x = x, y = y, color = group)) +
#'   ggplot2::geom_point(size = 4) +
#'   scale_color_lgbtq("intersex")
#'
#' @name lgbtq-scales
NULL

#' @rdname lgbtq-scales
#' @export
scale_color_lgbtq <- function(values, ...) {
  assert_scale_values(values)

  ggplot2::scale_color_manual(values = palette_lgbtq(values))
}

#' @rdname lgbtq-scales
#' @export
scale_colour_lgbtq <- scale_color_lgbtq

#' @rdname lgbtq-scales
#' @export
scale_fill_lgbtq <- function(values, ...) {
  assert_scale_values(values)

  ggplot2::scale_fill_manual(values = palette_lgbtq(values))
}

assert_scale_values <- function(values) {
  if (!is.character(values) || length(values) != 1 || is.na(values)) {
    rlang::abort("`values` parameter of a gglgbtq scale must take a single character with palette name.")
  }
}
