## Coursera Exploratory Data Analysis
## Week 1 Assignment 
## 
## Author: Robert Begg Mar 19, 2016
##
## Function: Plot4
##
## Description: Generate four plots required for plot4.png

library(dplyr)

source("./readEnergy.R")

plot4 <- function() {

##      Check if cached energy data is already loaded         
        if(!exists("energy")){
##              call readEnergy() utility function to read and clean data        
                energy <<- readEnergy()
        }
        
#      open png graphics device
        png( filename = "plot4.png",
             width = 480,
             height= 480 )

##      Create 2 by 2 plot output                
        par(mfcol=c(2,2))
        
        plotA() ## Plot Global Active Line
        plotB() ## Plot 3 line Sub Metering
        plotC() ## Plot Voltage line
        plotD() ## Plot Global Reactive Power line
        
##      close png device
        dev.off()
        
}        
        


plotA <- function(){
        
##      Plot Global Active Power line      
        with(energy,
             plot(Global_active_power ~ DateTime, 
                  type="l", 
                  xlab= "", 
                  ylab="Global Active Power (kilowatts)"))
} 

plotB <- function() {        
        
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
               bty="n",
               col=1:3)
        
        
        
}

plotC <- function(){
        
##      Plot Voltage line      
        with(energy,
             plot(Voltage ~ DateTime, 
                  type="l", 
                  xlab= "datetime", 
                  ylab="Voltage"))
}  

plotD <- function(){
        
##      Plot Global Reactive Power line      
        with(energy,
             plot(Global_reactive_power ~ DateTime, 
                  type="l", 
                  xlab= "datetime"))
} 
