#Packages to install
packages<-c("tidyverse", "fs","data.table","dplyr","readr", "purrr","sqldf","ggpubr")
install.packages(setdiff(packages, rownames(installed.packages())))  

library(data.table)
library(dplyr)
library(tidyverse)
library(fs)
library(lubridate)
library(sqldf)
library(magrittr)
library(ggpubr)

source("../Midterm/functions.R")

#Finding Directory containing the data

data_dir <- "stats"   #setting up the directory containing the csv files

#Merging csv files by scenarios 

one_wall_5 <- merge_scenario(one_wall_5,"1wall5targets*")
bounce_180 <- merge_scenario(bounce_180,"Bounce_180_*")
#one_wall_5 <- data_dir %>% 
#  dir_ls(regexp = "1wall5targets*") %>% 
#  map_dfr(read_csv, .id = "source")

#Bounce_180 <- data_dir %>% 
#  dir_ls(regexp = "Bounce_180_*") %>% 
#  map_dfr(read_csv, .id = "source")

#Renaming column for accessibility purposes

#rename_col(one_wall_5,2,"Kills")
#rename_col(Bounce_180,2,"Kills")

names(one_wall_5)[2] <- "Kills"
names(Bounce_180)[2] <- "Kills"


#Adding new column based on date of the scenario

one_wall_5_reformatted <- one_wall_5$source
one_wall_5_reformatted %<>%
  gsub("^(.{25})","",.) %>%
  gsub(".csv","",.) %>%
  gsub("\\.","-",.)

one_wall_5$date <- one_wall_5_reformatted
one_wall_5$date<- as.Date(one_wall_5$date)

Bounce_reformatted <- Bounce_180$source
Bounce_reformatted %<>%
  gsub("^(.{17})","",.) %>%
  gsub(".csv","",.) %>%
  gsub("\\.","-",.)

Bounce_180$date <- Bounce_reformatted
Bounce_180$date<- as.Date(Bounce_180$date)
#s <- as.Date(Bounce_reformatted)

print("Date reformatted correctly.")

#Creating new data frame with columns of interest


sql_one_wall5 <- sqldf('SELECT  Kills, Bot, Timestamp, date FROM one_wall_5 
           WHERE Kills == "pistol"')


sql_one_wall5$Bot <- as.double(sql_one_wall5$Bot)
sql_one_wall5$Timestamp <- as.double(sql_one_wall5$Timestamp)

sql_bounce_180 <- sqldf('SELECT  Kills, Bot, Timestamp, date FROM Bounce_180 
           WHERE Kills == "pistol"')
sql_bounce_180$Bot <- as.double(sql_bounce_180$Bot)
sql_bounce_180$Timestamp <- as.double(sql_bounce_180$Timestamp)

#Measuring Accuracy and creating a new column, only using accuracy right now

print("Accuracy Calculated, beep bop...bop")

sql_one_wall5$accuracy <- accuracy(sql_one_wall5)
sql_bounce_180$accuracy <- accuracy(sql_bounce_180)

print("End of data Formatting...")