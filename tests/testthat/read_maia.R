library(perimetry)
library(testthat)

my_path <- file.path(getwd(), "test_data", "tgz_export")
my_tgz <- show_tgz(my_path)
unpack_tgz(my_tgz)
my_tmp_dir <- create_ID_dirs(my_tgz)

test_that("extract",{
expect_warning(get_json(my_tmp_dir), regexp = NA)
expect_equal(nrow(get_json(my_tmp_dir)), 6)
}
)

# read_maia_tgz(my_path)
