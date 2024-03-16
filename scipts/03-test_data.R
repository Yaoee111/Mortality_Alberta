#### Preamble ####
# Purpose: Test cleaned data
# Author: Yiyi Yao, Zixi Song, Pu Yuan
# Date: 10 March 2024
# Contact: ee.yao@mail.utoronto.ca Kristy.szx@gmail.com scott.yuan@mail.utoronto.ca
# License: MIT
# Pre-requisites: 02-data_cleaning.R


#### Workspace setup ####
library(readr)
library(dplyr)

#### Test data ####
alberta_cod_clean <- read_csv("/cloud/project/data/analysis_data/deaths-causes.csv")

# Test 1: Check the range of "Calendar Year"
year_range <- range(alberta_cod_clean$calendar_year, na.rm = TRUE)
cat("Calendar Year range:", year_range[1], "to", year_range[2], "\n")

# Test 2: Ensure "Total Deaths" are positive numbers
negative_deaths <- sum(alberta_cod_clean$total_deaths < 0, na.rm = TRUE)
cat("Number of entries with negative 'Total Deaths':", negative_deaths, "\n")

# Test 3: Check for missing values
missing_values <- sum(is.na(alberta_cod_clean))
cat("Total missing values in the dataset:", missing_values, "\n")
