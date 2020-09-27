myFile <- "C:/Users/xdriz/Desktop/Data Science/Exploratory Data Analysis/household_power_consumption.txt"
myData <- read.table(myFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
setData <- myData[myData$Date %in% c("1/2/2007","2/2/2007") ,]

#store Data
globalactpow <- as.numeric(setData$Global_active_power)
time <- strptime(paste(setData$Date, setData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
subMeter1 <- as.numeric(setData$Sub_metering_1)
subMeter2 <- as.numeric(setData$Sub_metering_2)
subMeter3 <- as.numeric(setData$Sub_metering_3)

#create graph
png("plot3.png", width=480, height=480)
plot(time, subMeter1, type="l", ylab="Energy Submetering", xlab="")
lines(time, subMeter2, type="l", col="red")
lines(time, subMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1" ,"Sub_metering_2", "Sub_metering_3"), lty=1.25, lwd=2.75, col=c("black", "red", "blue"))
dev.off()
