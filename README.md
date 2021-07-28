
<!-- README.md is generated from README.Rmd. Please edit that file -->

# perimetry

R package for visual field analysis.

<!-- badges: start -->

[![Travis build
status](https://travis-ci.com/tjebo/perimetry.svg?branch=master)](https://travis-ci.com/tjebo/perimetry)
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
## basic example code
```








# tidyfields
A framework for the analysis of visual field (perimetry) data in R.


## Ideas

### 1. Input

### 2. Central object: tidyfield object

Nested tibble (acc. to https://vita.had.co.nz/papers/tidy-data.pdf )

#### 1. Layer (Exam level data, two-cols)

| variable  | value |
| ------------- | ------------- |
| Device | [MAIA / ...]  |
| DeviceID  | [ID]  |
| PatientID  | [PID]  |
| Lastname  | [Lastname]  |
| Firstname  | [Firstname]  |
| DOB  | [DOB]  |
| Age  | [Age]  |
| DOE  | [DOE, format: 2005-10-21 18:47:22]  |
| Background | [1.27 cd/m2] |
| StimulusSize | [G3] |
| StimulusColor | [white] |
| StimulusDuration | [200] |
| Staircase | ["4-2"] |
| FoveaPosition_X | [] |
| FoveaPosition_Y | [] |
| ONHDPosition_X | [] |
| ONHDPosition_Y | [] |
| AverageSensitivity | [] |
| AverageReactionTime | [] |
| BCEA95% | [] |
| BCEA63% | [] |
| ------------- | ------------- |
| FundusImage | [Image raw bytes of the JPEG] |
| Testpoints | [nested tibble] |
| BlindSpotTrials | [nested tibble] |
| FixationData | [nested tibble] |

#### 2. Layer

2a. Testpoints

| ID | X | Y | FinalThreshold | Intensities | Responses | ResponseTimes | fixated | prior
| -- | - | - | ---------------| ----------- | ----------| --------------| ------- | -----  
| 1  | 0 | 0 | 26 | c(32,28,24,26) | c(0,0,1,1) | c(NA, NA, NA, NA) | c(NA, NA, NA, NA) | Nested table with pdf for ZEST

2b. BlindSpotTrials

| ID | X | Y | FinalThreshold | Intensities | Responses | ResponseTimes 
| -- | - | - | ----------| ----------| ----------| ----------|
| 0  | 14 | 2 | 26 | c(10,10,10,10) | c(0,0,0,1) | c(NA, NA, NA, NA) 

2c. Fixation data

[todo]


### 3. "Mind the gap" function
Function that completes inputs, that are not stored in the original device output, but that are 'imputable'.

E.g., Response [y/n] not saved in MAIA files, but imputable from the staircase values

### 4. Coordinate system
Fixed XY
- xy converted to deg. in visual field space
- Ideal for binocular anlyses

Flipped XY ("left-eye convention")
- Ideal for normal data comparison

> Maybe, both should be included in tidyfield object
> Some convention is needed throughout the package, i.e., each X and Y should have a suffix that specifies the meaning (e.g., "Yvsdeg" for visual field space and degrees )

### Normal data

- Systematic comparison of spatial interpolation techniques necessary

### Output statistics 

Spatially-ignorant metrics (will be spatially-weighted)
- Mean Sensitivity [dB]
- Mean Deviation [dB]
- PSD [dB]
- Mean Loss [dB]
- Sqrt. of Loss Variance [dB]

Spatially-adjusted metrics 
- Vol. [dB*sr]
- Loss [dB*sr]
- PSD [dB*sr]


