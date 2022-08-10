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

# Default settings are fine
theme_bisexual <- ggplot2::theme
