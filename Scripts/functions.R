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

#add each scenario as one big dataset

merge_scenario <- function(file_name, scenario_name){
  file_name <- data_dir %>% 
    dir_ls(regexp = scenario_name) %>% 
    map_dfr(read_csv, .id = "source")
  return(file_name)
}

#renames the column needed

rename_col <- function(file_name,col_num,new_name){
  names(file_name)[col_num] <- new_name
}

#transform a column's data into doubles

double_transformation <- function(file_name_col_name){
  return(file_name$col_name <- as.double(file_name$col_name))
}

#calculate accuracy of column

accuracy <- function(file_name){
  file_name$accuracy <- file_name$Bot/file_name$Timestamp
}

#creates graphs

graph <- function(file_name,starting_date, ending_date)
{
  ggplot(file_name, aes(x=date, y=accuracy)) +
    geom_line( color="steelblue") + 
    geom_point() +
    xlab("Months") +
    theme(axis.text.x=element_text(angle=60, hjust=1)) +
    scale_x_date(limit=c(as.Date(starting_date),as.Date(ending_date))) +
    ylim(0,1)
}