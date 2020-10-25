
install.packages(c("tidyverse", "fs","data.table","dplyr","readr", "purrr"))

library(data.table)
library(dplyr)
library(purrr)
library(readr)

setwd("C:/Users/Master/Desktop/510/Midterm/stats")
#data <- read.csv(file = "X1wall_6targets_small_2020_07_08")
#View(data)

#Opening the CSV file and loading the content into "data"
test <- read_csv("1wall 6targets small - Challenge - 2020.07.08-08.11.18 Stats.csv")
data <- test
View(test)

#Creating variable of interest: score of the session
totalScore <- as.double(data[102,2])
kills <- as.double(data[91,2])
maxScorePossible <- as.double(data[90,2])
Accuracy <- kills/maxScorePossible 
AccuracyPercentage <- Accuracy * 100

#Importing all the files into one

#tbl_fread <- list.files(pattern = "Bo.*csv") %>% map_df(~fread(.))
tbl <-
  list.files(pattern = "*.csv") %>% 
  map_df(~read_csv(.))

wall_6_targets <-
  list.files(pattern = "1wall5targets_pasu*.csv") %>% 
  map_df(~read_csv(.))
