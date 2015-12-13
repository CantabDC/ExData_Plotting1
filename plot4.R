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
png(file="plot4.png")
  par(mfrow = c(2,2))
  
  with(data, {
    plot(Date_time, Global_active_power, type="l", xlab="", ylab="Global Active Power")
    plot(Date_time, Voltage, type="l", xlab="datetime", ylab="Voltage")
    plot(Date_time, Sub_metering_1, typ="l", xlab="", ylab="Energy sub metering")
      lines(Date_time, Sub_metering_2, type="l",  col="red")
      lines(Date_time, Sub_metering_3, type="l", col="blue")
      legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, bty="n", text.width = strwidth("Sub_metering_1"))
   plot(Date_time, Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power")
  })
dev.off()