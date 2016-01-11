power.data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
power.data$Date <- as.Date(power.data$Date, "%d/%m/%Y")

subset.power <- subset(power.data, Date == as.Date("2007-02-01") 
                      | Date == as.Date("2007-02-02"))
                      
subset.power$Global_active_power <- as.numeric(subset.power$Global_active_power)
     
png(filename = "plot2.png", width = 480, height = 480, units = "px")

subset.power$DateTime <- paste(subset.power$Date, subset.power$Time, sep = " ")
subset.power$DateTime <- as.POSIXct(subset.power$DateTime)     
            
plot(subset.power$DateTime, subset.power$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")

dev.off()