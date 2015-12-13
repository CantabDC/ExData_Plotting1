## Read data
data <- read.table("household_power_consumption.txt", header=TRUE, sep =";", na.strings = "?")

## COnvert dates from factor to date 
data$Date <- as.Date(data$Date, "%d/%m/%Y")

## Subset data for Feb 1 and Feb 2
library(dplyr)
data <- filter(data, Date=="2007-02-01" | Date=="2007-02-02")

## Create single variable combining date and time
Date_time <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
data <- cbind(Date_time, data)

## Create plot
with (data, plot(Date_time, Global_active_power, typ="l", xlab ='', ylab = "Global Active Power (kilowatts)"))
par(mar=c(4,6,2,2))

## Save as png
dev.copy(png, file="plot2.png")
dev.off()