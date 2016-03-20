## Coursera Exploratory Data Analysis
## Week 1 Assignment 
## 
## Author: Robert Begg Mar 19, 2016
##
## Function: readEnergy
##
## Description :
##      Reads file "household_power_consumption.txt" from current directory
##      Converts Date and Time variables to POSIXct DateTime variable
##      returns data only for 207, Feb 1 & 2
##

library(dplyr)

readEnergy <- function() {

##      read file into data frame
        energyDF <- read.delim(
                        "household_power_consumption.txt",
                        sep=";",
                        na.strings = "?",
                        stringsAsFactors = FALSE )
        
## convert data frame to tbl_df
## convert char date to date
## combine date and time to POSIXct DateTime variable
## filter only 2007 Feb 1 & 2
## Drop original Date and Time variables             
        tbl_df(energyDF) %>%
                mutate( 
                        Date = as.Date(Date,"%d/%m/%Y"), 
                        DateTime = as.POSIXct(
                                        strptime(
                                                paste(Date,Time),
                                                format=" %Y-%m-%d %H:%M:%S"))) %>%
                filter(Date == "2007-02-01" | Date == "2007-02-02") %>%
                select(DateTime, everything(), -Date, -Time)

}