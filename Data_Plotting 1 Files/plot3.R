## R Script Plot3.R
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
png(file = "plot3.png", width=480, height = 480)
plot(z,data$Sub_metering_3, xlab="", ylab="Energy sub metering", type = "l", col="blue",
     ylim=c(0,25))                                                                                                    
        points(z,data$Sub_metering_2, col="red", type="l")
        points(z,data$Sub_metering_1,  type="l")
        legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                col=c("black","red","blue"),lty=c(1,1,1),cex=.75)

dev.off()
## End of Plot3 Script