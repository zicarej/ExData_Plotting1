## R Script Plot4.R
## Reads household_power_consumption.txt file and produces four graphs
##    of power consumption data by time for 2/1/2007 and 2/2/2007
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
## set up graph parameters and output to PNG

png(file = "plot4.png", width=480, height = 480)
par(mfrow=c(2,2))
## Plot 1  Global Active Power
plot(z,data$Global_active_power,xlab="", ylab="Global Active Power", type = "l")
## Plot 2  Voltage
plot(z,data$Voltage,xlab="datetime", ylab="Voltage", type = "l")
## Plot 3
plot(z,data$Sub_metering_3, xlab="", ylab="Energy sub metering", type = "l", col="blue",
     ylim=c(0,25))                                                                                                    
points(z,data$Sub_metering_2, col="red", type="l")
points(z,data$Sub_metering_1,  type="l")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=c(1,1,1),cex=.75,bty="n")
## Plot 4  Global Reactive Power
plot(z,data$Global_reactive_power,xlab="datetime", ylab="Global_reactive_power", type = "l")
dev.off()
## End of Plot4 Script