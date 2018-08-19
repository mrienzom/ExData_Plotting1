## Reads in data and creates a histogram of global active power usage using the
## base plotting package.

library(sqldf)
library(lubridate)
data <- read.csv.sql("household_power_consumption.txt", sql = "select * from 
                        file where Date = '1/2/2007' or Date = '2/2/2007'", 
                        sep = ";")
data$DateTime <- dmy_hms(paste(data$Date, data$Time))
png("plot1.png")
hist(data$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()