#### Preamble ####
# Purpose: Downloads and saves the data from Opendata Alberta
# Author: Yiyi Yao, Zixi Song, Pu Yuan
# Date: 10 March 2024
# Contact: ee.yao@mail.utoronto.ca Kristy.szx@gmail.com scott.yuan@mail.utoronto.ca
# License: MIT
# Pre-requisites: none


#### Workspace setup ####
install.packages("readr")
library(readr)
install.packages("curl")
library(curl)


#### Download data ####
alberta_cod <-
  read_csv(
    "https://open.alberta.ca/dataset/03339dc5-fb51-4552-97c7-853688fc428d/resource/3e241965-fee3-400e-9652-07cfbf0c0bda/download/deaths-leading-causes.csv",
    skip = 2,
    col_types = cols(
      `Calendar Year` = col_integer(),
      Cause = col_character(),
      Ranking = col_integer(),
      `Total Deaths` = col_integer()
    )
  ) 


#### Save data ####
write_csv(alberta_cod, "/cloud/project/data/raw_data/deaths-leading-causes.csv") 

         
