#' Pipe operator
#'
#' See \code{magrittr::\link[magrittr:pipe]{\%>\%}} for details.
#'
#' @name %>%
#' @rdname utils
#' @keywords internal
#' @export
#' @importFrom magrittr %>%
#' @usage lhs \%>\% rhs
#' @param lhs A value or the magrittr placeholder.
#' @param rhs A function call using the magrittr semantics.
#' @return The result of calling `rhs(lhs)`.
NULL

#' tools and lookups
#' @keywords internal
lu_names <- c(
  threshold = "threshold",
  bcea_63 = "bcea_63" ,
  bcea_95 = "bcea_95",
  bcea_angle = "bcea_angle",
  est_fov_loc ="estimated fovea location",
  av_sens ="average sens",
  av_reac = "aver. reac",
  rototrans = "rototransl",
  maia_sn = "maia s/n",
  pat_id = "patient id",
  duration = "duration",
  mesopic_id = "expert exam",
  scotopic_id = "scotopic exam",
  scotopic_fu_id = "scotopic follow",
  mesopic_fu_id = "follow up exam",
  date = "exam date",
  reg_pts = "registration points",
  fix_pts = "fixation points",
  px2deg = "pix2deg",
  fix_loss = "fixation loss",
  prl_i = "prl_i",
  prl_f = "prl_f",
  prl_dist = "dist. prl",
  prl_i_bl = "baseline prl_i"
)

#' recode_sex
#'
#' @rdname  utils
#' @description convenience function for recoding of the sex variable
#' @importFrom eye tidyNA
#' @author Tjebo
#' @param x vector
#' @return character vector
#' @keywords internal
#'
recode_sex <- function(x){
  x <- tolower(eye::tidyNA(x))
  sexstrings <- list(m = c("m", "male"), f = c("f", "female", "w"))
  lookups <- data.frame(match = rep(names(sexstrings), lengths(sexstrings)),
                        token = unlist(sexstrings))
  lookups$match[match(x, lookups$token)]
}

