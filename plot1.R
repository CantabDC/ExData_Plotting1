## Read data
data <- read.table("household_power_consumption.txt", header=TRUE, sep =";", na.strings = "?")

## COnvert dates from factor to date 
data$Date <- as.Date(data$Date, "%d/%m/%Y")

## Subset data for Feb 1 and Feb 2
library(dplyr)
data <- filter(data, Date=="2007-02-01" | Date=="2007-02-02")

## Create histogram
with(data, hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab="Frequency", col="red"))

## Save as png
dev.copy(png, file="plot1.png")
dev.off()