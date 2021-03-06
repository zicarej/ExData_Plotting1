## R Script Plot2.R
## Reads household_power_consumption.txt file and produces a line graph
##    of Global Active Power by time for 2/1/2007 and 2/2/2007
##
setwd("~/Desktop/Exploratory Data Analysis")
household_power_consumption <- read.csv("household_power_consumption.txt", 
                                        sep=";", na.strings="?",colClasses=c("character","character",
                                                                             "numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
inX <- (household_power_consumption$Date=="2/1/2007")|(household_power_consumption$Date=="2/2/2007")
data <- household_power_consumption[inX,]
## create time variable
x <- paste(data$Date,data$Time)
z <- strptime(x,"%m/%d/%Y %H:%M:%S")
## create line graph
plot(z,data$Global_active_power, ylab="Global Active Power (kilowatts)", type = "l")
## Copy plot to a PNG file
dev.copy(png, file = "plot2.png", width=480, height = 480) 
## End of plot2.R script
dev.off()
## End of Plot1 Script