household <- read.csv(file = "household_power_consumption.txt", na.strings = "?", sep = ";")
household <- transform(household, Date = as.Date(household$Date, "%d/%m/%Y"))
household.dates <- subset(household, Date == "2007-02-01" | Date == "2007-02-02")
household.dates <- transform(household.dates,
                             DateTime = as.POSIXct(paste(Date, Time), 
                                                   format="%Y-%m-%d %H:%M:%S"))

png(filename = "figure2.png", width = 480, height = 480)

with(household.dates, 
     plot(DateTime, Global_active_power, type = 'l', xlab = "", 
          ylab = "Global Active Power (kilowatts)"))

dev.off()
