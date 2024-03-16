#### Preamble ####
# Purpose: Clean the raw data 
# Author: Yiyi Yao, Zixi Song, Pu Yuan
# Date: 10 March 2024
# Contact: ee.yao@mail.utoronto.ca Kristy.szx@gmail.com scott.yuan@mail.utoronto.ca
# License: MIT
# Pre-requisites: 01-download_data.R

#### Workspace setup ####
library(readr)
library(janitor)
library(dplyr)
library(stringr)

#### Clean data ####
alberta_cod <- read_csv("/cloud/project/data/raw_data/deaths-leading-causes.csv")

alberta_cod_clean <- alberta_cod %>%
  select(-Ranking) %>% # Remove the "Ranking" column
  clean_names() %>% # Standardize column names for consistency
  add_count(cause) %>% # Add a count of occurrences for each cause
  mutate(cause = str_trunc(cause, 30))

#### Save data ####
write_csv(alberta_cod_clean, "/cloud/project/data/analysis_data/deaths-causes.csv")
