#' Use default theme for an LGBTQ palette
#'
#' @description Provides a default theme for a given palette. Most LGBTQ flags
#' contain white, for which the default light gray background of ggplot2 is too
#' light. Conversely, this same gray is too dark for flags with yellow stripes.
#' LGBTQ themes are carefully curated for each palette.
#'
#' @template name
#' @param ... \code{ANY}\cr
#'  Parameters passed to \code{\link[ggplot2]{theme}()}.
#'
#' @eval roxygen_available_palettes()
#'
#' @return A ggplot2 `theme` object.
#'
#' @examples
#' library(ggplot2)
#' ggplot(data.frame(x = 1:10, y = 15:6,
#'                   group = rep(c("a", "b"), each = 5)),
#'        aes(x = x, y = y, color = group)) +
#'   geom_point(size = 4) +
#'   scale_color_manual(values = palette_lgbtq("intersex")) +
#'   # Use the same name as for values, preferably
#'   theme_lgbtq("intersex")
#'
#' @importFrom ggplot2 theme element_rect element_line rel
#' @export
theme_lgbtq <- function(name, ...) {
  if (!name %in% names(pride_data)) {
    stop("Theme doesn't exist!", call. = FALSE)
  }

  extract_theme(name)(...)
}

theme_lgbtq_default <- function(...) {
  ggplot2::theme(
    panel.background = element_rect(fill = "grey82", color = NA),
    panel.grid.minor = element_line(size = rel(0.5)),
    legend.key = element_rect(fill = "grey82", color = NA),
    ...
  )
}

theme_lgbtq_white <- function(...) {
  ggplot2::theme(
    panel.background = element_rect(fill = "white", color = NA),
    panel.border = element_rect(fill = NA, color = "black"),
    panel.grid = element_line(color = "grey92"),
    panel.grid.minor = element_line(size = rel(0.5)),
    legend.key = element_rect(fill = "white", color = NA),
    ...
  )
}

theme_agender <- function(...) {
  ggplot2::theme(
    panel.background = element_rect(fill = "#DDE3D8", color = NA),
    panel.grid.minor = element_line(size = rel(0.5)),
    legend.key = element_rect(fill = "#DDE3D8", color = NA),
    ...
  )
}

theme_demiboy <- function(...) {
  ggplot2::theme(
    panel.background = element_rect(fill = "#D8E0E3", color = NA),
    panel.grid.minor = element_line(size = rel(0.5)),
    legend.key = element_rect(fill = "#D8E0E3", color = NA),
    ...
  )
}

theme_demigirl <- function(...) {
  ggplot2::theme(
    panel.background = element_rect(fill = "#E3DADD", color = NA),
    panel.grid.minor = element_line(size = rel(0.5)),
    legend.key = element_rect(fill = "#E3DADD", color = NA),
    ...
  )
}

# Default settings are fine too
theme_ggplot2 <- ggplot2::theme
