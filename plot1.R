dt <- read.table("household_power_consumption.txt",header = T,sep = ";",na.strings = "?")
dt$date <- as.Date(dt$Date, format="%d/%m/%Y")
dt.active <- subset(dt, dt$date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")))
png(filename="plot1.png", width=480, height=480, units="px")
hist(dt.active$Global_active_power, col="red", main= "Global Active Power", xlab = "Global Active Power (kilowatts)", ylim = c(0,1200))
dev.off()

