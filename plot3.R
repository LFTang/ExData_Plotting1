dt <- read.table("household_power_consumption.txt",header = T,sep = ";",na.strings = "?")
dt$strDatetime <- paste(dt$Date," ",dt$Time)
dt$date <- as.Date(dt$Date, format="%d/%m/%Y")
dt.active <- subset(dt, dt$date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")))
dt.active$datetime <- strptime(dt.active$strDatetime, format= "%d/%m/%Y %H:%M:%S")

#Follwing line is irrelavent
#dt.active <- subset(dt, dt$datetime > strptime("2007-02-01", "%Y-%m-%d") & dt$datetime < strptime("2007-02-02","%Y-%m-%d"))

png(filename="plot3.png", width=480, height=480, units="px")
plot(dt.active$datetime, dt.active$Sub_metering_1, type = 'l', xlab = '', ylab = 'Energy sub metering')
lines(dt.active$datetime, dt.active$Sub_metering_2, col='red')
lines(dt.active$datetime, dt.active$Sub_metering_3, col='blue')

legend('topright', lwd = 1, col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), cex = 0.5) 

dev.off()

