#Prepare data
library(lubridate)
data <- read.table("./household_power_consumption.txt", sep = ';', header = TRUE)
data <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007',]
data$datetime <- dmy_hms(paste(data$Date,data$Time))
data$Global_active_power <- as.numeric(levels(data$Global_active_power))[data$Global_active_power]
data$Sub_metering_1 <- as.numeric(levels(data$Sub_metering_1))[data$Sub_metering_1]
data$Sub_metering_2 <- as.numeric(levels(data$Sub_metering_2))[data$Sub_metering_2]
data$Sub_metering_3 <- as.numeric(levels(data$Sub_metering_3))[data$Sub_metering_3]
data$Voltage <- as.numeric(levels(data$Voltage))[data$Voltage]
data$Global_reactive_power <- as.numeric(levels(data$Global_reactive_power))[data$Global_reactive_power]
#Construct the plot
png(file = "plot3.png")
plot(data$datetime, data$Sub_metering_1, type = 'l', xlab = "", ylab = "Energy sub metering" )
lines(data$datetime, data$Sub_metering_2, type = "l", col = "red")
lines(data$datetime, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_1","Sub_metering_1"))
dev.off()