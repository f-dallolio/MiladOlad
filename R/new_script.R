#' @export
new_script <- function(name, dir = "scripts", open = rlang::is_interactive()) {
  name <- format(substitute(name))
  dir <- file.path(rprojroot::find_package_root_file(), dir)
  if(!dir.exists(dir)) dir.create(dir)
  file <- sprintf("%s.R", gsub("[.][Rr]$", "", name))
  path <- file.path(dir, file)

  out <- c("devtools::document(quiet = TRUE)",
           "devtools::load_all()",
           "", "")
  write(out, path)
  rstudioapi::documentOpen(path, line =-1)
  invisible(TRUE)
}
