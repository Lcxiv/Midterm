install.packages(c("tidyverse", "fs","data.table","dplyr","readr", "purrr","sqldf"))

library(data.table)
library(dplyr)
library(tidyverse)
library(fs)
library(lubridate)
library(sqldf)

setwd("C:/Users/Master/Desktop/510/Midterm/stats")

#Experimenting with readr

data_dir <- "stats"   #setting up the directory containing the csv files
#fs::dir_ls(data_dir)

#Merging csv files by scenarios and adding their source to differentiate them once merged

one_wall_5 <- data_dir %>% 
  dir_ls(regexp = "1wall5") %>% 
  map_dfr(read_csv, .id = "source")

colnames(one_wall_5)
names(one_wall_5)[2] <- "Kills"
colnames(one_wall_5)

#creating new dataframe with columns of interest
a <- sqldf('SELECT Source,Kills, Timestamp FROM one_wall_5 WHERE Kills == "Kills:" OR Kills == "pistol"')


  