library(testthat)
library(Midterm)

source("../Midterm/data_cleaning.R")

test_check("Midterm")

test_that("is a double", {
  expect_equal(is.double(1), 1)
  expect_equal(is.double(2), 2)
  expect_equal(is.double(3), 3)
})