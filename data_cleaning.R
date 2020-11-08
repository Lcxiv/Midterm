install.packages(c("tidyverse", "fs","data.table","dplyr","readr", "purrr","sqldf"))

library(data.table)
library(dplyr)
library(tidyverse)
library(fs)
library(lubridate)
library(sqldf)
library(magrittr)

#Finding Directory containing the data

data_dir <- "stats"   #setting up the directory containing the csv files

#Merging csv files by scenarios 

one_wall_5 <- data_dir %>% 
  dir_ls(regexp = "1wall5targets*") %>% 
  map_dfr(read_csv, .id = "source")

#Changing weird column name

names(one_wall_5)[2] <- "Kills"

#Adding new column based on date of the scenario

rename_one_wall_5 <- one_wall_5$source
rename_one_wall_5 %<>%
  gsub("^(.{25})","",.) %>%
  gsub(".csv","",.) %>%
  gsub("\\.","-",.)

one_wall_5$date <- rename_one_wall_5
one_wall_5$date<- as.Date(one_wall_5$date)


#Creating new data frame with columns of interest

sql_one_wall5 <- sqldf('SELECT  Kills, Bot, Timestamp, date FROM one_wall_5 
           WHERE Kills == "pistol"')
sql_one_wall5$Bot <- as.double(sql_one_wall5$Bot)
sql_one_wall5$Timestamp <- as.double(sql_one_wall5$Timestamp)

#Measuring Accuracy and creating a new column, only using accuracy right now

sql_one_wall5$accuracy <- sql_one_wall5$Bot/sql_one_wall5$Timestamp



#Plotting graph

p <- ggplot(sql_one_wall5, aes(x=date, y=accuracy)) +
  geom_line( color="steelblue") + 
  geom_point() +
  xlab("") +
  theme(axis.text.x=element_text(angle=60, hjust=1)) +
  scale_x_date(limit=c(as.Date("2020-07-29"),as.Date("2020-10-18"))) +
  ylim(0.5,1)
p


#Repeating process for a different Scenario

Bounce_180 <- data_dir %>% 
  dir_ls(regexp = "Bounce_180_*") %>% 
  map_dfr(read_csv, .id = "source")

names(Bounce_180)[2] <- "Kills"

#Adding new column based on date of the scenario

Bounce_rename <- Bounce_180$source
Bounce_rename %<>%
  gsub("^(.{17})","",.) %>%
  gsub(".csv","",.) %>%
  gsub("\\.","-",.)

Bounce_180$date <- Bounce_rename
Bounce_180$date<- as.Date(Bounce_180$date)
s <- as.Date(Bounce_rename)


#Creating new data frame with columns of interest

sql_bounce_180 <- sqldf('SELECT  Kills, Bot, Timestamp, date FROM Bounce_180 
           WHERE Kills == "pistol"')
sql_bounce_180$Bot <- as.double(sql_bounce_180$Bot)
sql_bounce_180$Timestamp <- as.double(sql_bounce_180$Timestamp)

#Measuring Accuracy and creating a new column

sql_bounce_180$accuracy <- sql_bounce_180$Bot/sql_bounce_180$Timestamp



#Plotting graph

p <- ggplot(sql_bounce_180, aes(x=date, y=accuracy)) +
  geom_line( color="steelblue") + 
  geom_point() +
  xlab("") +
  theme(axis.text.x=element_text(angle=60, hjust=1)) +
  scale_x_date(limit=c(as.Date("2020-07-08"),as.Date("2020-10-18"))) +
  ylim(0.5,1)
p