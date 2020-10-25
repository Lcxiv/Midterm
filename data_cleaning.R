install.packages(c("tidyverse", "fs","data.table","dplyr","readr", "purrr"))

library(data.table)
library(dplyr)
library(tidyverse)
library(fs)
library(lubridate)

setwd("C:/Users/Master/Desktop/510/Midterm/stats")

#Experimenting with readr

data_dir <- "stats"   #setting up the directory containing the csv files
#fs::dir_ls(data_dir)

#Merging csv files by scenarios and adding their source to differentiate them once merged

one_wall_6 <- data_dir %>% 
  dir_ls(regexp = "1wall 6") %>% 
  map_dfr(read_csv, .id = "source")

library(stringr)
testname <- "1wall 6targets small - Challenge - 2020.07.08-08.11.18 Stats.csv"
#YR <- str_extract(testname, "\\d{4,6}" )

YR <- strsplit(testname, "\\-")

newname <- paste(YR[[1]][1],YR[[1]][3])
newfilename <- str_replace_all(newname,fixed(" "),"_")
newfilename

