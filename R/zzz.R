#.onLoad <- function(libname, pkgname) {
#  # Carrega o pacote reticulate
#  if (!requireNamespace("reticulate", quietly = TRUE)) {
#    stop("Reticulate not Found.")
#  }
#  
#  # Verifica se o Python esta disponível
#  if (!reticulate::py_available(initialize = TRUE)) {
#    stop("Python not found.")
#  }
#  
#  if (!reticulate::virtualenv_exists("fibos_venv")) {
#    reticulate::virtualenv_create("fibos_venv")
#    reticulate::virtualenv_install("fibos_venv", packages = "fibos")
#  }
#  
#  # Configura o uso do ambiente virtual
#  reticulate::use_virtualenv("fibos_venv", required = TRUE)
#}

.onLoad <- function(libname, pkgname) {
  if (!requireNamespace("reticulate", quietly = TRUE)) {
    stop("Reticulate not found.")
  }
  if (Sys.which("python") == ""){
    stop("Python not found.")
  }
  reticulate::py_require("fibos")
  
  fibos <<- reticulate::import("fibos", delay_load = TRUE)
}
