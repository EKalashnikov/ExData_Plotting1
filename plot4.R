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
png(file="plot4.png", 
    bg = "transparent", 
    width = 480, 
    height = 480)
## Create plot
par(mfcol=c(2,2))
## Part 1
plot(data$DT, 
     data$Global_active_power, 
     type = "l",
     xlab="",
     ylab="Global Active Power")
## Part 2
plot(data$DT, 
     data$Sub_metering_1, 
     col = "Black",
     type = "l",     
     xlab="",
     ylab="Energy sub metering")
lines(data$DT, 
      data$Sub_metering_2, 
      col = "Red")
lines(data$DT, 
      data$Sub_metering_3, 
      col = "Blue")
legend("topright",
       lty=c(1, 1, 1),
       col=c("Black", "Red", "Blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty="n")
## Part 3
plot(data$DT,
     data$Voltage,
     type = "l",
     xlab="datetime",
     ylab="Voltage")
## Part 4
plot(data$DT,
     data$Global_reactive_power,
     type = "l",
     xlab="datetime",
     ylab="Global_reactive_power")
## Close launch device
dev.off()
