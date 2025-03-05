.onLoad <- function(libname, pkgname) {
  # Carrega o pacote reticulate
  if (!requireNamespace("reticulate", quietly = TRUE)) {
    stop("O pacote 'reticulate' é necessário, mas não está instalado.")
  }
  
  # Verifica se o Python está disponível
  if (!reticulate::py_available(initialize = TRUE)) {
    stop("Python não encontrado.")
  }
  
  # Verifica se o ambiente virtual 'meu_ambiente' já existe
  if (!reticulate::virtualenv_exists("fibos_venv")) {
#    message("Criando ambiente virtual 'meu_ambiente'...")
    reticulate::virtualenv_create("fibos_venv")
#    message("Instalando o pacote Python no ambiente virtual...")
    reticulate::virtualenv_install("fibos_venv", packages = "fibos")
  }
  
  # Configura o uso do ambiente virtual
  reticulate::use_virtualenv("fibos_venv", required = TRUE)
}
