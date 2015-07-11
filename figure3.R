household <- read.csv(file = "household_power_consumption.txt", na.strings = "?", sep = ";")
household <- transform(household, Date = as.Date(household$Date, "%d/%m/%Y"))
household.dates <- subset(household, Date == "2007-02-01" | Date == "2007-02-02")
household.dates <- transform(household.dates,
                             DateTime = as.POSIXct(paste(Date, Time), 
                                                   format="%Y-%m-%d %H:%M:%S"))

png(filename = "figure3.png", width = 480, height = 480)

with(household.dates, {
  plot(DateTime, Sub_metering_1, type = 'l', xlab = "", 
          ylab = "Energy sub metering")
  points(DateTime, Sub_metering_2, type = 'l', col = "red")
  points(DateTime, Sub_metering_3, type = 'l', col = "blue")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         col = c("black", "red", "blue"), lty = c(1, 1, 1))
  })

dev.off()
