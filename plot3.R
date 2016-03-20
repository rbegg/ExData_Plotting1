## Coursera Exploratory Data Analysis
## Week 1 Assignment 
## 
## Author: Robert Begg Mar 19, 2016
##
## Function: Plot3
##
## Description: Generate plot3

library(dplyr)

source("./readEnergy.R")

plot3 <- function() {

##      Check if cached energy data is already loaded         
        if(!exists("energy")){
##              call readEnergy() utility function to read and clean data        
                energy <<- readEnergy()
        }
        
#      open png graphics device
        png( filename = "plot3.png",
             width = 480,
             height= 480 )

##      Plot first line         
        plot(Sub_metering_1 ~ DateTime,
             data = energy,
             type = "l", 
             xlab = "", 
             ylab = "Energy sub metering")
        
##      Add second line        
        lines(Sub_metering_2 ~ DateTime,
             data = energy,
             type = "l",
             col = "red",
             xlab = "")
        
##      Add third line        
        lines(Sub_metering_3 ~ DateTime,
              data = energy,
              type = "l",
              col = "blue",
              xlab = "")
        
##      Add Legend        
        legend("topright",
               c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
               lty=1, 
               col=1:3)
        
##      close png device
        dev.off()

}