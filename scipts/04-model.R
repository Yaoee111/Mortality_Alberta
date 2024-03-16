#### Preamble ####
# Purpose: Models base on cleaned data
# Author: Yiyi Yao, Zixi Song, Pu Yuan
# Date: 10 March 2024
# Contact: ee.yao@mail.utoronto.ca Kristy.szx@gmail.com scott.yuan@mail.utoronto.ca
# License: MIT
# Pre-requisites: 02-data_cleaning.R


#### Workspace setup ####
library(readr)
install.packages("MASS")
library(MASS)

#### Read data ####
alberta_cod_clean <- read_csv("/cloud/project/data/analysis_data/deaths-causes.csv")

### Model data ####
alberta_cod_clean$cause_numeric <- as.numeric(as.factor(alberta_cod_clean$cause))

# Fit a negative binomial model
nb_model <- glm.nb(total_deaths ~ calendar_year + cause_numeric, data = alberta_cod_clean)

# Check the summary of the model to understand the fit
summary(nb_model)

#### Save model ####
saveRDS(nb_model, file = "/cloud/project/model/nb_death_model.rds")

