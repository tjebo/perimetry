## code to prepare `DATASET` dataset goes here
# read pfau data and replace <0 with -1
library(tidyverse)
library(eye)
data_wide <- read.csv("data-raw/norm_pfau.csv", header=TRUE, sep=";", stringsAsFactors = FALSE) %>%
  mutate_at(.vars = vars(contains('X')), function(x) str_replace(x, '<0','-1'))
#data to long format
#splitting columns, removing "X" in the "position" variable
# reassigning data types
norm_pfau <-
  data_wide %>%
  pivot_longer(names_to = 'position', values_to = 'value', X0_0:X10_180) %>%
  separate(position, sep = "_", into = c("eccent", "angle")) %>%
  separate(Type, sep =  "_", into  = c("testtype", "testnumber")) %>%
  mutate(eccent = as.integer(str_replace(eccent, "X", "")),
         angle = as.integer(angle),
         value = as.integer(value),
         testtype = tolower(testtype),
         lens = replace_na(Lens, 'natural'),
         lens = if_else(lens != "pp", "natural", "pseudo"),
         sex = if_else(Sex == 'Male', 'm','f'),
         eye = recodeye(Eye),
         angle = ifelse(.data$eye == 'l', 180- .data$angle, .data$angle),
         angle = ifelse(sign(.data$angle) == -1,
                        360 + .data$angle, .data$angle),
         angle = ifelse(.data$eccent == 0, 0, .data$angle)
  ) %>%
  select(patID = Patient.ID, eye, age = Age, sex, lens, testID = Examination.ID, contains('Fixation'),
         wrong = WrongPressureEvents, testtype, testnumber, avg_rctn = Average.reaction.time,
         eccent, angle, value) %>%
  select(-testID)
  #calculate difference of cyan and red exam
  # pivot_wider(id_cols = c(patID, testtype, testnumber, eccent, angle) ,
  #             names_from = 'testtype', values_from = 'value',
  #             .keep_all = TRUE)
  # %>%
  # mutate(cr_diff = cyan - red) %>%
  # pivot_longer(names_to = 'testtype', values_to = 'value', cols = mesopic:cr_diff) %>%
  # mutate(testID = paste(patID, eye, testtype, testnumber, sep = '_')) %>%
  # arrange(testID, eccent, angle) %>%
  # group_by(testID) %>%
  # mutate(stimID = seq_along(testID)) %>%
  # ungroup()
usethis::use_data(norm_pfau, overwrite = TRUE)

denniss_names <-
  unname(unlist(read.csv("data-raw/norm_denniss.csv", header=FALSE)[1, ])) %>%
  gsub("\\(", "x", .) %>%
  gsub(", ", ",y", .) %>%
  gsub("\\)", "", .)
data_denniss <- setNames(read.csv("data-raw/norm_denniss.csv"), denniss_names)

norm_denniss <- data_denniss %>%
  pivot_longer(cols = starts_with("x"), names_pattern = "x(.+),y(.+)",
               names_to = c("x", "y"), values_to = "threshold") %>%
  select(patID = Participant, sex = "Male/Female",
         age = starts_with("Age"), eye = "Eye tested",
         VA = matches("^VA"), everything()) %>%
  mutate(eye = recodeye(eye))

usethis::use_data(norm_denniss, overwrite = TRUE)
