
<!-- README.md is generated from README.Rmd. Please edit that file -->

# perimetry

R package for visual field analysis.

<!-- badges: start -->

[![Travis build
status](https://travis-ci.com/tjebo/perimetry.svg?branch=master)](https://travis-ci.com/tjebo/perimetry)
[![R-CMD-check](https://github.com/tjebo/perimetry/workflows/R-CMD-check/badge.svg)](https://github.com/tjebo/perimetry/actions)
<!-- badges: end -->

perimetry will simplify visual field analysis based on current concepts
and understanding of visual field data.

## Features

## Installation

NOT YET ON CRAN

Development version on github (here!)

``` r
# install.packages("devtools")
devtools::install_github("tjebo/perimetry")
```

## Example

``` r
library(perimetry)
```

# tidyfields

A framework for the analysis of visual field (perimetry) data in R.

## Ideas

### 1. Input

### 2. Central object: tidyfield object

``` r
str(tidyfield_mock)
#> tibble [1 × 24] (S3: tbl_df/tbl/data.frame)
#>  $ Device             : chr "[MAIA / ...]"
#>  $ DeviceID           : chr "[ID]"
#>  $ PatientID          : chr "[PID]"
#>  $ Lastname           : chr "[Lastname]"
#>  $ Firstname          : chr "[Firstname]"
#>  $ DOB                : chr "[DOB]"
#>  $ Age                : chr "[Age]"
#>  $ DOE                : chr "[DOE, format: 2005-10-21 18:47:22]"
#>  $ Background         : chr "[1.27 cd/m2]"
#>  $ StimulusSize       : chr "[G3]"
#>  $ StimulusColor      : chr "[white]"
#>  $ StimulusDuration   : chr "[200]"
#>  $ Staircase          : chr "['4-2']"
#>  $ FoveaPosition_X    : chr "[]"
#>  $ FoveaPosition_Y    : chr "[]"
#>  $ ONHDPosition_X     : chr "[]"
#>  $ ONHDPosition_Y     : chr "[]"
#>  $ AverageSensitivity : chr "[]"
#>  $ AverageReactionTime: chr "[]"
#>  $ BCEA95%            : chr "[]"
#>  $ BCEA63%            : chr "[]"
#>  $ FixationData       : chr "[nested tibble]"
#>  $ blindspot          :List of 1
#>   ..$ : tibble [1 × 1] (S3: tbl_df/tbl/data.frame)
#>   .. ..$ BlindSpotTrials: spec_tbl_df [1 × 7] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
#>   .. .. ..$ ID            : num 0
#>   .. .. ..$ X             : num 14
#>   .. .. ..$ Y             : num 2
#>   .. .. ..$ FinalThreshold: num 26
#>   .. .. ..$ Intensities   : chr "c(10,10,10,10)"
#>   .. .. ..$ Responses     : chr "c(0,0,0,1)"
#>   .. .. ..$ ResponseTimes : chr "c(NA, NA, NA, NA)"
#>   .. .. ..- attr(*, "spec")=List of 3
#>   .. .. .. ..$ cols   :List of 7
#>   .. .. .. .. ..$ ID            : list()
#>   .. .. .. .. .. ..- attr(*, "class")= chr [1:2] "collector_double" "collector"
#>   .. .. .. .. ..$ X             : list()
#>   .. .. .. .. .. ..- attr(*, "class")= chr [1:2] "collector_double" "collector"
#>   .. .. .. .. ..$ Y             : list()
#>   .. .. .. .. .. ..- attr(*, "class")= chr [1:2] "collector_double" "collector"
#>   .. .. .. .. ..$ FinalThreshold: list()
#>   .. .. .. .. .. ..- attr(*, "class")= chr [1:2] "collector_double" "collector"
#>   .. .. .. .. ..$ Intensities   : list()
#>   .. .. .. .. .. ..- attr(*, "class")= chr [1:2] "collector_character" "collector"
#>   .. .. .. .. ..$ Responses     : list()
#>   .. .. .. .. .. ..- attr(*, "class")= chr [1:2] "collector_character" "collector"
#>   .. .. .. .. ..$ ResponseTimes : list()
#>   .. .. .. .. .. ..- attr(*, "class")= chr [1:2] "collector_character" "collector"
#>   .. .. .. ..$ default: list()
#>   .. .. .. .. ..- attr(*, "class")= chr [1:2] "collector_guess" "collector"
#>   .. .. .. ..$ skip   : int 1
#>   .. .. .. ..- attr(*, "class")= chr "col_spec"
#>  $ testpoints         :List of 1
#>   ..$ : tibble [1 × 1] (S3: tbl_df/tbl/data.frame)
#>   .. ..$ Testpoints: spec_tbl_df [1 × 9] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
#>   .. .. ..$ ID            : num 1
#>   .. .. ..$ X             : num 0
#>   .. .. ..$ Y             : num 0
#>   .. .. ..$ FinalThreshold: num 26
#>   .. .. ..$ Intensities   : chr "c(32,28,24,26)"
#>   .. .. ..$ Responses     : chr "c(0,0,1,1)"
#>   .. .. ..$ ResponseTimes : chr "c(NA, NA, NA, NA)"
#>   .. .. ..$ fixated       : chr "c(NA, NA, NA, NA)"
#>   .. .. ..$ prior         : chr "Nested table with pdf for ZEST"
#>   .. .. ..- attr(*, "spec")=List of 3
#>   .. .. .. ..$ cols   :List of 9
#>   .. .. .. .. ..$ ID            : list()
#>   .. .. .. .. .. ..- attr(*, "class")= chr [1:2] "collector_double" "collector"
#>   .. .. .. .. ..$ X             : list()
#>   .. .. .. .. .. ..- attr(*, "class")= chr [1:2] "collector_double" "collector"
#>   .. .. .. .. ..$ Y             : list()
#>   .. .. .. .. .. ..- attr(*, "class")= chr [1:2] "collector_double" "collector"
#>   .. .. .. .. ..$ FinalThreshold: list()
#>   .. .. .. .. .. ..- attr(*, "class")= chr [1:2] "collector_double" "collector"
#>   .. .. .. .. ..$ Intensities   : list()
#>   .. .. .. .. .. ..- attr(*, "class")= chr [1:2] "collector_character" "collector"
#>   .. .. .. .. ..$ Responses     : list()
#>   .. .. .. .. .. ..- attr(*, "class")= chr [1:2] "collector_character" "collector"
#>   .. .. .. .. ..$ ResponseTimes : list()
#>   .. .. .. .. .. ..- attr(*, "class")= chr [1:2] "collector_character" "collector"
#>   .. .. .. .. ..$ fixated       : list()
#>   .. .. .. .. .. ..- attr(*, "class")= chr [1:2] "collector_character" "collector"
#>   .. .. .. .. ..$ prior         : list()
#>   .. .. .. .. .. ..- attr(*, "class")= chr [1:2] "collector_character" "collector"
#>   .. .. .. ..$ default: list()
#>   .. .. .. .. ..- attr(*, "class")= chr [1:2] "collector_guess" "collector"
#>   .. .. .. ..$ skip   : int 1
#>   .. .. .. ..- attr(*, "class")= chr "col_spec"
```

### 3. “Mind the gap” function

Function that completes inputs, that are not stored in the original
device output, but that are ‘imputable’

E.g., Response \[y/n\] not saved in MAIA files, but imputable from the
staircase values

### 4. Coordinate system

Fixed XY - xy converted to deg. in visual field space - Ideal for
binocular anlyses

Flipped XY (“left-eye convention”) - Ideal for normal data comparison

> Maybe, both should be included in tidyfield object Some convention is
> needed throughout the package, i.e., each X and Y should have a suffix
> that specifies the meaning (e.g., “Yvsdeg” for visual field space and
> degrees )

### Normal data

-   Systematic comparison of spatial interpolation techniques necessary

### Output statistics

Spatially-ignorant metrics (will be spatially-weighted) - Mean
Sensitivity \[dB\] - Mean Deviation \[dB\] - PSD \[dB\] - Mean Loss
\[dB\] - Sqrt. of Loss Variance \[dB\]

Spatially-adjusted metrics - Vol. \[dB\*sr\] - Loss \[dB\*sr\] - PSD
\[dB\*sr\]
