test_that("Authentication follows correct format", {
  email <- "user_email"
  key <- "user_key"
  found_authentication <- create.authentication(email, key)
  exp_authentication <-  "&email=user_email&key=user_key"
  expect_equal(found_authentication, exp_authentication)
})

test_that("Basic call is setup correctly", {
  endpoint <- "list/States"
  exp_call <- "https://aqs.epa.gov/data/api/list/States?&email=fake_aqs_email&key=fake_aqs_key"
  found_call <- epair:::create.base.call(endpoint)
  expect_equal(found_call, exp_call)
})

test_that("Single variable added to query properly", {
  variables <- list("state" = "37")
  base <- "https://aqs.epa.gov/data/api/dailyData/byState?"
  exp_query <- "https://aqs.epa.gov/data/api/dailyData/byState?&state=37"
  found_query <- add.variables(base, variables)
  expect_equal(found_query, exp_query)
})

test_that("Multiple variables added to query properly", {
  endpoint <- "dailyData/byState?"
  variables <- list("state" = '37', 
                    "bdate" = '20200101', 
                    "edate" = '20200102', 
                    "param" = '44201')
  exp_call <- "dailyData/byState?&state=37&bdate=20200101&edate=20200102&param=44201"
  found_call <- add.variables(endpoint, variables)
  expect_equal(found_call, exp_call)
})

test_that("Variables containing spaces are accepted into a potential call", {
  base <- "http//my_website/email=myEmail&key=myKey/endpoint?"
  vars <- list("state" = "10", "param_with_space" = "param aqi")
  found <- epair::add.variables(base, vars)
  exp <- "http//my_website/email=myEmail&key=myKey/endpoint?&state=10&param_with_space=param%20aqi"
  expect_equal(found, exp)
})
