## Coursera Exploratory Data Analysis
## Week 1 Assignment 
## 
## Author: Robert Begg Mar 19, 2016
##
## Function: Plot2
##
library(dplyr)
source("./readEnergy.R")

plot2 <- function() {

##      Check if cached energy data is already loaded         
        if(!exists("energy")){
##              call readEnergy() utility function to read and clean data        
                energy <<- readEnergy()
        }
        
##      open png graphics device        
        png( filename = "plot2.png",
             width = 480,
             height= 480 )
        
##      Plot line         
        with(energy,
                plot(Global_active_power ~ DateTime, 
                     type="l", 
                     xlab= "", 
                     ylab="Global Active Power (kilowatts)"))
        
##      close png device
        dev.off()

}