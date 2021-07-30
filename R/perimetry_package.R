#' perimetry
#' @name perimetry
#' @docType package
#' @description An R framework for perimetry analysis. Currently only
#'    supporting MAIA device, but the architecture of the package allows
#'    for extension to other devices.
#' @section Extracting data:
#'    Extracting data from MAIA raw (tgz) or .txt in a single call.
#' @section Statistics:
#' Spatially-ignorant metrics (will be spatially-weighted)
#' - Mean Sensitivity (dB)
#' - Mean Deviation (dB)
#' - PSD (dB)
#' - Mean Loss (dB)
#' - Sqrt. of Loss Variance (dB)
#'
#' Spatially-adjusted metrics
#' - Vol. (dB*sr)
#' - Loss (dB*sr)
#' - PSD (dB*sr)

#' @section Visualisation:
#' perimetry also includes functions for some more or less common visualization
#'  of visual field data
#' @author Tjebo Heeren and Maximilian Pfau and ... TBC!
NULL
