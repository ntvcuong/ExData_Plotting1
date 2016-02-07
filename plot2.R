#Prepare data
library(lubridate)
data <- read.table("./household_power_consumption.txt", sep = ';', header = TRUE)
data <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007',]
data$datetime <- dmy_hms(paste(data$Date,data$Time))
data$Global_active_power <- as.numeric(levels(data$Global_active_power))[data$Global_active_power]
data$Voltage <- as.numeric(levels(data$Voltage))[data$Voltage]
data$Global_reactive_power <- as.numeric(levels(data$Global_reactive_power))[data$Global_reactive_power]
#Construct the plot
png(file = "plot2.png")
plot(data$datetime,data$Global_active_power, type = "l",ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()