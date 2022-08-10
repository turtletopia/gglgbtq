.onLoad <- function(libname, pkgname) {
  prev_options <- options()

  new_options <- list(
    gglgbtq_bg = "white",
    gglgbtq_font_size = 2.5
  )

  unset_inds <- !(names(new_options) %in% names(prev_options))
  if (any(unset_inds)) {
    options(new_options[unset_inds])
  }

  invisible()
}
