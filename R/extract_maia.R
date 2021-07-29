#' data extraction
#' @rdname  extract_maia
#' @description For data extraction of MAIA files
#' @param folder source folder. Default: workdirectory
#' @keywords internal
show_tgz <- function(folder = getwd()){
  tgz_dirs <- file.path(folder, list.files(folder)[grepl(".tgz", list.files(folder))])

  if (identical(tgz_dirs, character(0))) {
    stop("No tgz file in the specified directory")
  }
  tgz_dirs
}

#' @rdname  extract_maia
#' @param tgz_dirs character vector of tgz folders
#' @importFrom utils untar
#' @keywords internal
unpack_tgz <- function(tgz_dirs){
  lapply(tgz_dirs, function(x) utils::untar(x, exdir = normalizePath(tempdir())))
}

#' @rdname  extract_maia
#' @param tgz_dirs character vector of tgz folders
#' @importFrom stringr str_extract
#' @importFrom utils untar
#' @keywords internal
create_ID_dirs <- function(tgz_dirs){
  patID <- unname(sapply(tgz_dirs, function(x) stringr::str_extract(x,  "(?i)(?<=patient)\\d+")))
  tmpdir_patID <- file.path(normalizePath(tempdir()), patID)
  setNames(tmpdir_patID, patID)
}

#' @rdname  extract_maia
#' @description Extracts name, dob and and sex from MAIA observers.
#' This data is stored in json files attached to the microperimetry files.
#' It is generally not recommended to use this function explicitly in order to
#' keep personal identifiable data as safe as possible.
#' @param folder source folder. Default: workdirectory
#' @import dplyr
#' @importFrom jsonlite fromJSON
#' @keywords internal
get_json <- function(ID_dirs)  {
  patID <- names(ID_dirs)
  dir <- paste0(file.path(ID_dirs, patID),".json")
  JsonData <- lapply(dir, function(x) jsonlite::fromJSON(txt = x)$patient)
  to_extract <- c(patID = 'id', name = 'lastname', first_name = 'firstname', sex = 'gender', DOB = 'birthdate')
  res <- dplyr::bind_rows(JsonData)[to_extract]
  dplyr::rename(res, !!!to_extract)
}




