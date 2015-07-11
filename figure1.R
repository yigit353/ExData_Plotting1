household <- read.csv(file = "household_power_consumption.txt", na.strings = "?", sep = ";")
household <- transform(household, Date = as.Date(household$Date, "%d/%m/%Y"))
household.dates <- subset(household, Date == "2007-02-01" | Date == "2007-02-02")

png(filename = "figure1.png", width = 480, height = 480)

with(household.dates, 
     hist(Global_active_power, col = "red", xlim = c(0, 6), 
          xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))

dev.off()
