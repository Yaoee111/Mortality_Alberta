#### Preamble ####
# Purpose: Simulate data base on Opendata Alberta
# Author: Yiyi Yao, Zixi Song, Pu Yuan
# Date: 10 March 2024
# Contact: ee.yao@mail.utoronto.ca Kristy.szx@gmail.com scott.yuan@mail.utoronto.ca
# License: MIT
# Pre-requisites: none


#### Workspace setup ####
install.packages("tibble")
library(tibble)

#### Simulate data ####
alberta_death_simulation <-
  tibble(
    cause = rep(x = c("Heart", "Lung", "Infarction"), times = 10),
    year = rep(x = 2020:2022, times = 10),
    deaths = rnbinom(n = 30, size = 20, prob = 0.1)
  )

alberta_death_simulation
