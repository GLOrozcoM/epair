context("Call constructions to API are accurate")
library(epair)

test_that("Authentication follows correct format", {
  email <- "user_email"
  key <- "user_key"
  found_authentication <- create.authentication(email, key)
  exp_authentication <-  "&email=user_email&key=user_key"
  expect_equal(found_authentication, exp_authentication)
})

test_that("Basic call is setup correctly", {
  options(epa_authentication = "user_option")
  endpoint <- "list/States"
  exp_call <- "https://aqs.epa.gov/data/api/list/States?user_option"
  found_call <- create.base.call(endpoint)
  expect_equal(found_call, exp_call)
})

test_that("Single variable added to query properly", {
  state <- "37"
  base <- "https://aqs.epa.gov/data/api/dailyData/byState?"
  exp_query <- "https://aqs.epa.gov/data/api/dailyData/byState?&state=37"
  found_query <- add.variable(base, state)
  expect_equal(found_query, exp_query)
})

test_that("Multiple variables added to query properly", {
  endpoint <- "dailyData/byState?"
  variable.list <- list("state" = '37', 
                         "bdate" = '20200101', 
                         "edate" = '20200102', 
                         "param" = '44201')
  exp_call <- "dailyData/byState?&state=37&bdate=20200101&edate=20200102&param=44201"
  found_call <- add.variables(endpoint, variable.list)
  expect_equal(found_call, exp_call)
})
