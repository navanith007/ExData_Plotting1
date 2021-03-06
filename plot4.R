library(tidyverse)
library(lubridate)
setwd("F:/DS/Exploratory Data Analysis")
# reading text data format
data <- read.table("household_power_consumption.txt",
                   header = TRUE, 
                   sep = ";", 
                   colClasses = c("character", "character", rep("numeric", 7)),
                   na.strings = "?")
data <- as.data.frame(data)
data$Date <- as.character(data$Date)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
# subsetting the data from only two days
date1 <- as.Date("2007-02-01")
date2 <- as.Date("2007-02-02")
req_data <- subset(data, Date == date1 | Date == date2)
req_data$Datetime <- as.POSIXct(paste(req_data$Date, req_data$Time))
#plotting
par(mfrow = c(2,2))
par(mar = c(2,4,2,1))
plot(req_data$Datetime,
     req_data$Global_active_power,
     type = "line",
     xlab = "",
     ylab = "Global Active Power")

plot(req_data$Datetime,
     req_data$Voltage,
     type = "line",
     xlab = "",
     ylab = "Voltage")
par(mar = c(2,4,2,1))
plot(req_data$Datetime,
     req_data$Sub_metering_1,
     "n",
     xlab = "",
     ylab = "Energy Sub Metering")
     points(req_data$Datetime,
            req_data$Sub_metering_1,
            type = "line")
     points(req_data$Datetime,
            req_data$Sub_metering_2,
            type = "line",
            col = "red")
     points(req_data$Datetime,
            req_data$Sub_metering_3,
            type = "line",
            col = "blue")
legend("topright",
       legend = c("Sub_metering1", "Sub_metering2", "Sub_metering3"),
       col = c("black", "red", "blue"),
       lty = c(1, 1, 1),
       bty = "n")

plot(req_data$Datetime,
     req_data$Global_reactive_power,
     type = "line",
     xlab = "",
     ylab = "Global Reactive Power")

dev.copy(png, "plot4.png")
dev.off()
