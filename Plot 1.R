data <- read.table('household_power_consumption.csv', sep=";", dec=".", header=TRUE, nrows=5)
classes <- sapply(data, class)
data <- read.table('household_power_consumption.csv', sep=";", dec=".", header=TRUE, colClasses=classes, na.strings = "?")

data $TimeStamp <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

data2 <- data[as.Date(data$Date, format="%d/%m/%Y") > as.Date('2007-01-31') &
                (as.Date(data$Date, format="%d/%m/%Y") < as.Date('2007-02-03')),]
# PLOT 1
par(mfrow=c(1,1))
hist(data2$Global_active_power, main='Global Active Power', xlab='Global Active Power (Killowatts)', col='red')
dev.copy(png, "plot 1.png")
dev.off()
