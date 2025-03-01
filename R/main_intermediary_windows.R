#' @title Surface Calc
#' @name execute
#'
#' @description The implemented function executes the implemented methods.
#'              Using this function, it is possible to calculate occluded areas
#'              through the traditional methodology, Occluded Surface, or by
#'              applying the Fibonacci OS methodology. At the end of the method
#'              execution, the "prot.srf" file is generated, and returned for
#'              the function. The data in this file refers to all contacts
#'              between atoms of molecules present in a protein's PDB.
#'
#'
#' @seealso [read_prot()]
#' @seealso [read_osp()]
#' @seealso [occluded_surface()]
#'
#' @importFrom stats rnorm
#'
#' @author Carlos Henrique da Silveira (carlos.silveira@unifei.edu.br)
#' @author Herson Hebert Mendes Soares (hersonhebert@hotmail.com)
#' @author Joao Paulo Roquim Romanelli (joaoromanelli@unifei.edu.br)
#' @author Patrick Fleming (Pat.Fleming@jhu.edu)

#'
execute_windows = function(pdb, method){
  python_ok <- tryCatch({
    reticulate::py_config()
    TRUE
  }, error = function(e) FALSE)
  if (!python_ok) {
    stop("Python not found.")
#    reticulate::install_python()
#    reticulate::py_config()
    
  }
  if (!reticulate::py_module_available("fibos")) {
      reticulate::py_install("fibos")
  }
  fibos = reticulate::import("fibos")
  result_occluded = fibos$occluded_surface(pdb,method)
  return(result_occluded)
}

osp_windows = function(file){
  python_ok <- tryCatch({
    reticulate::py_config()
    TRUE
  }, error = function(e) FALSE)
  if (!python_ok) {
    message("Python not found.")
    reticulate::install_python()
    reticulate::use_python(python_binary_path(), required = TRUE)
    reticulate::py_config()
  }
  if (!reticulate::py_module_available("fibos")) {
    reticulate::py_install("fibos")
  }
  fibos = reticulate::import("fibos")
  result_osp = fibos$osp(file)
  return(result_osp)
}