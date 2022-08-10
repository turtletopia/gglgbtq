extract_colors <- function(palette) {
  pride_data[[palette]][["colors"]]
}

extract_theme <- function(palette) {
  pride_data[[palette]][["theme"]] %||% theme_lgbtq_default
}

`%||%` <- function(object, default) {
  if (is.null(object)) default else object
}
