## Read data
colNames <- c("Date",
              "Time",
              "Global_active_power",
              "Global_reactive_power",
              "Voltage",
              "Global_intensity",
              "Sub_metering_1",
              "Sub_metering_2",
              "Sub_metering_3")
data <- read.table("household_power_consumption.txt", 
                   na.strings = "?", 
                   sep = ";", 
                   col.names = colNames,
                   header = FALSE,
                   skip = 66637,
                   nrows = 2880)
data$DT <- strptime(paste(data$Date, data$Time), 
                    format = "%d/%m/%Y %H:%M:%S")
## Launch graphics device
png(file="plot2.png", 
    bg = "transparent", 
    width = 480, 
    height = 480)
## Create plot
plot(data$DT, 
     data$Global_active_power, 
     type = "l",
     xlab="",
     ylab="Global Active Power (kilowatts)")
## Close launch device
dev.off()
