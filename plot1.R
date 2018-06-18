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
#plotting
par(mar = c(2,2,2,2))
hist(req_data$Global_active_power,
     col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

dev.copy(png, "plot1.png")
dev.off()