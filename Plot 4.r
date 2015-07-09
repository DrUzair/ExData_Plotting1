data <- read.table('household_power_consumption.csv', sep=";", dec=".", header=TRUE, nrows=5)
classes <- sapply(data, class)
data <- read.table('household_power_consumption.csv', sep=";", dec=".", header=TRUE, colClasses=classes, na.strings = "?")

data $TimeStamp <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

data2 <- data[as.Date(data$Date, format="%d/%m/%Y") > as.Date('2007-01-31') &
 (as.Date(data$Date, format="%d/%m/%Y") < as.Date('2007-02-03')),]
#PLOT 4
par(mfrow=c(2,2))
plot(data2$Global_active_power ~ data2$TimeStamp, type='l', xlab='', ylab='Global Active Power')
plot(data2$Voltage ~ data2$TimeStamp, type='l', xlab='Date Time', ylab='Voltage')
sub_metering <- data2[, c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3', 'TimeStamp')] 
plot(range(sub_metering[,4]), range(sub_metering[,1:3]), xlab='Date Time', ylab='Energy Sub Metering')
lines(sub_metering[,4], sub_metering[,1], col = 'black')
lines(sub_metering[,4], sub_metering[,2], col = 'red')
lines(sub_metering[,4], sub_metering[,3], col = 'green')
legend('topright', c('Sub Metering 1', 'Sub Metering 2', 'Sub Metering 3') , lty=1, col=c('black', 'red', 'blue'), bty='n', cex=.75)
plot(data2$Global_reactive_power ~ data2$TimeStamp, type='l', xlab='Date Time', ylab='Global Reactive Power')
dev.copy(png, "plot 4.png")
dev.off()
