roxygen_available_palettes <- function() { # nocov start
  palettes <- names(pride_data)
  c(
    "@section Available palettes:",
    "Currently available palettes are:",
    paste0("* \x60", palettes, "\x60 (",
           lengths(lapply(palettes, palette_lgbtq)), " colors)")
  )
} # nocov end
