install.packages(c("tidyverse", "fs","data.table","dplyr","readr", "purrr","sqldf"))

library(data.table)
library(dplyr)
library(tidyverse)
library(fs)
library(lubridate)
library(sqldf)
library(magrittr)

setwd("C:/Users/Master/Desktop/510/Midterm")

#Finding Directory containing the data

data_dir <- "stats"   #setting up the directory containing the csv files
#fs::dir_ls(data_dir)

#Merging csv files by scenarios 

one_wall_5 <- data_dir %>% 
  dir_ls(regexp = "1wall5targets*") %>% 
  map_dfr(read_csv, .id = "source")

#Changing weird column name

names(one_wall_5)[2] <- "Kills"

#Adding new column based on date of the scenario

x <- one_wall_5$source
x %<>%
  gsub("^(.{25})","",.) %>%
  gsub(".csv","",.) %>%
  gsub("\\.","-",.)
x
one_wall_5$date <- x


#Creating new data frame with columns of interest

sql_one_wall5 <- sqldf('SELECT  Kills, Bot, Timestamp, date FROM one_wall_5 
           WHERE Kills == "pistol" GROUP BY date')
sql_one_wall5$Bot <- as.double(sql_one_wall5$Bot)
sql_one_wall5$Timestamp <- as.double(sql_one_wall5$Timestamp)

#Measuring Accuracy and creating a new column

sql_one_wall5$accuracy <- sql_one_wall5$Bot/sql_one_wall5$Timestamp
