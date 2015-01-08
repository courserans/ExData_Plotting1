## Plot 3 : Project 1 : Exploratory Data Analysis

## 1. Read the source data
## 2. Use the Transform and subset function to select the valid data set
## 3. Use the plot and the png function to create a graph and generate a plot3.png

## The assumption is the source data file is in the current working directory

rawdata <- read.csv("household_power_consumption.txt", sep =";",na.strings="?",stringsAsFactors=FALSE)
rawdata <- transform(rawdata, Date=as.Date(Date,"%d/%m/%Y"))
data <- subset(rawdata, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

png(file = "plot3.png", width=480, height=480 ) 
plot(as.POSIXct(paste(data$Date, data$Time)),data$Sub_metering_1,type ="l",xlab="", ylab = "Energy sub metering")
lines(as.POSIXct(paste(data$Date, data$Time)),data$Sub_metering_2, col = "red")
lines(as.POSIXct(paste(data$Date, data$Time)),data$Sub_metering_3, col = "blue")
legend ("topright", lty=c(1,1,1), 
        col = c("black", "red", "blue"),
        legend = c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 "))
dev.off()