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
  # Carrega o pacote reticulate
  if (!requireNamespace("reticulate", quietly = TRUE)) {
    stop("O pacote 'reticulate' é necessário, mas não está instalado.")
  }
  
  # Declara a dependência do pacote Python 'fibos'
  reticulate::py_require("fibos")
  
  # Importa o módulo Python 'fibos' com carregamento adiado
  fibos <<- reticulate::import("fibos", delay_load = TRUE)
}
