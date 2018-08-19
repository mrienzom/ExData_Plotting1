## Reads in data and creates a line plot of energy sub metering data over the
## range 2/1/07 - 2/2/07

library(sqldf)
library(lubridate)
data <- read.csv.sql("household_power_consumption.txt", sql = "select * from 
                     file where Date = '1/2/2007' or Date = '2/2/2007'", 
                     sep = ";")
data$DateTime <- dmy_hms(paste(data$Date, data$Time))
png("plot3.png")
with(data, plot(DateTime, Sub_metering_1, type = "n", xlab = "", 
                ylab = "Energy sub metering"))
with(data, lines(DateTime, Sub_metering_1))
with(data, lines(DateTime, Sub_metering_2, col = "red"))
with(data, lines(DateTime, Sub_metering_3, col = "blue"))
with(data, legend("topright", c("Sub_metering_1", "Sub_metering_2", 
                                "Sub_metering_3"), col = c("black", "red", 
                                                           "blue"), lwd = 1))
dev.off()