power.data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
power.data$Date <- as.Date(power.data$Date, "%d/%m/%Y")

subset.power <- subset(power.data, Date == as.Date("2007-02-01") 
                      | Date == as.Date("2007-02-02"))
                      
subset.power$Global_active_power <- as.numeric(subset.power$Global_active_power)
     
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))

subset.power$DateTime <- paste(subset.power$Date, subset.power$Time, sep = " ")
subset.power$DateTime <- as.POSIXct(subset.power$DateTime)     

plot(subset.power$DateTime, subset.power$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")
plot(subset.power$DateTime, subset.power$Voltage, ylab = "Voltage", xlab = "datetime", type = "l")

plot(subset.power$DateTime, subset.power$Sub_metering_1, ylab = "Energy sub metering"
     , xlab = "", type = "l")
points(subset.power$DateTime, subset.power$Sub_metering_2, col = "red", type = "l")
points(subset.power$DateTime, subset.power$Sub_metering_3, col = "blue", type = "l")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       , text.col = c("black","red","blue"))

plot(subset.power$DateTime, subset.power$Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", type = "l")

dev.off()