## Reads in data and creates a line plot of global active power usage over the
## range 2/1/07 - 2/2/07

library(sqldf)
library(lubridate)
data <- read.csv.sql("household_power_consumption.txt", sql = "select * from 
                     file where Date = '1/2/2007' or Date = '2/2/2007'", 
                     sep = ";")
data$DateTime <- dmy_hms(paste(data$Date, data$Time))
png("plot2.png")
with(data, plot(DateTime, Global_active_power, type = "l", xlab = "", 
                ylab = "Global Active Power (kilowatts)"))
dev.off()