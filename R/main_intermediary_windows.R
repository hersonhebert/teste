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
  python = reticulate::import("fibos")
  python$occluded_surface(pdb, method)
  
  if (tolower(fs::path_ext(pdb)) == "pdb") {
    pdb = fs::path_ext_remove(pdb)
  }
  
  prot = paste("prot_", pdb, sep = "")
  prot = fs::path_ext_set(prot, "srf")
  prot = fs::path("fibos_files", prot)
  
  return(read_prot(prot))
}

osp_windows = function(file){
  python = reticulate::import("fibos")
  result = python$osp(file)
  file = fs::path_ext_remove(file)
  file = fs::path_ext_set(file,"pak")
  return(read_osp(file))
}
