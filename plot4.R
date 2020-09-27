myFile <- "C:/Users/xdriz/Desktop/Data Science/Exploratory Data Analysis/household_power_consumption.txt"
myData <- read.table(myFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
setData <- myData[myData$Date %in% c("1/2/2007","2/2/2007") ,]

#store Data
globalactpow <- as.numeric(setData$Global_active_power)
globalreactpow <- as.numeric(setData$Global_reactive_power)
time <- strptime(paste(setData$Date, setData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
subMeter1 <- as.numeric(setData$Sub_metering_1)
subMeter2 <- as.numeric(setData$Sub_metering_2)
subMeter3 <- as.numeric(setData$Sub_metering_3)
volts <- as.numeric(setData$Voltage)

#create graph
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))
plot(time, globalactpow, type="l", xlab="", ylab="Global Active Power")
plot(time, volts, type="l", xlab="datetime", ylab="Voltage")
plot(time, subMeter1, type="l", ylab="Energy sub metering", xlab="")
lines(time, subMeter2, type="l", col="red")
lines(time, subMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1" ,"Sub_metering_2", "Sub_metering_3"), lty=1.25, lwd=2.75, col=c("black", "red", "blue"))
plot(time, globalactpow, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
