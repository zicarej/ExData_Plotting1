## R Script Plot1.R
## Reads household_power_consumption.txt file and produces a histogram
##    of Global Active Power variable for 2/1/2007 and 2/2/2007
##
setwd("~/Desktop/Exploratory Data Analysis")
household_power_consumption <- read.csv("household_power_consumption.txt", 
        sep=";", na.strings="?",colClasses=c("character","character",
        "numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
inX <- (household_power_consumption$Date=="2/1/2007")|(household_power_consumption$Date=="2/2/2007")
data <- household_power_consumption[inX,]
## print histogram
hist(data$Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Active Power",
               col="red")
## Copy histogram to a PNG file
dev.copy(png, file = "plot1.png", width=480, height = 480) 
dev.off()
## End of Plot1 Script

