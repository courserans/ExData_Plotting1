## Plot 2 : Project 1 : Exploratory Data Analysis

## 1. Read the source data
## 2. Use the Transform and subset function to select the valid data set
## 3. Use the plot and the png function to create a graph and generate a plot2.png

## The assumption is the source data file is in the current working directory

png(file = "plot2.png", width=480, height=480 ) 
rawdata <- read.csv("household_power_consumption.txt", sep =";",na.strings="?",stringsAsFactors=FALSE)
rawdata <- transform(rawdata, Date=as.Date(Date,"%d/%m/%Y"))
data <- subset(rawdata, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

plot(as.POSIXct(paste(data$Date, data$Time)),data$Global_active_power,type ="l",xlab="", ylab = "Global Active Power (kilowatts)")
dev.off()