## Coursera Exploratory Data Analysis
## Week 1 Assignment 
## 
## Author: Robert Begg Mar 19, 2016
##
## Function: Plot1
##
library(dplyr)
source("./readEnergy.R")

plot1 <- function() {

##      Check if cached energy data is already loaded         
        if(!exists("energy")){
##              call readEnergy() utility function to read and clean data        
                energy <<- readEnergy()
        }
        
##      open png graphics device        
        png( filename = "plot1.png",
             width = 480,
             height= 480 )
        
##      Plot histogram        
        hist(energy$Global_active_power, 
             col="red",
             main="Global Active Power", 
             xlab = "Global Active Power (kilowatts)" )
        
##      close png device
        dev.off()

}