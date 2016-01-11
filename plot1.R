power.data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
power.data$Date <- as.Date(power.data$Date, "%d/%m/%Y")

subset.power <- subset(power.data, Date == as.Date("2007-02-01") 
                      | Date == as.Date("2007-02-02"))
                      
subset.power$Global_active_power <- as.numeric(subset.power$Global_active_power)
     
png(filename = "plot1.png", width = 480, height = 480, units = "px")
                 
hist(subset.power$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")

dev.off()