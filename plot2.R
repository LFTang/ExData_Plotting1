dt <- read.table("household_power_consumption.txt",header = T,sep = ";",na.strings = "?")
dt$strDatetime <- paste(dt$Date," ",dt$Time)
dt$date <- as.Date(dt$Date, format="%d/%m/%Y")
dt.active <- subset(dt, dt$date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")))
dt.active$datetime <- strptime(dt.active$strDatetime, format= "%d/%m/%Y %H:%M:%S")

#Follwing two lines is irrelavent
#dt.active <- subset(dt, dt$datetime > strptime("2007-02-01", "%Y-%m-%d") & dt$datetime < strptime("2007-02-02","%Y-%m-%d"))

png(filename="plot2.png", width=480, height=480, units="px")
plot(dt.active$datetime, dt.active$Global_active_power, type = 'l', xlab = '', ylab = 'Global Active Power (kilowatts)')
dev.off()

