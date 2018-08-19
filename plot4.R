## Reads in data and creates a 2x2 grid of 4 plots: (1) Global Active Power vs.
## Time, (2) Energy Sub Metering vs. Time, (3) Voltage vs. Time, and (4) Global
## Reactive Power vs. Time

library(sqldf)
library(lubridate)
data <- read.csv.sql("household_power_consumption.txt", sql = "select * from 
                     file where Date = '1/2/2007' or Date = '2/2/2007'", 
                     sep = ";")
data$DateTime <- dmy_hms(paste(data$Date, data$Time))
png("plot4.png")
par(mfcol = c(2,2))
with(data, plot(DateTime, Global_active_power, type = "l", xlab = "", 
                ylab = "Global Active Power (kilowatts)"))
with(data, plot(DateTime, Sub_metering_1, type = "n", xlab = "", 
                ylab = "Energy sub metering"))
with(data, lines(DateTime, Sub_metering_1))
with(data, lines(DateTime, Sub_metering_2, col = "red"))
with(data, lines(DateTime, Sub_metering_3, col = "blue"))
with(data, legend("topright", c("Sub_metering_1", "Sub_metering_2", 
                                "Sub_metering_3"), bty = "n", 
                  col = c("black", "red", "blue"), lwd = 1))
with(data, plot(DateTime, Voltage, type = "l", xlab = "datetime", 
                ylab = "Voltage"))
with(data, plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime", 
                ylab = "Global_reactive_power"))
dev.off()