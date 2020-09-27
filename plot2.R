myFile <- "C:/Users/xdriz/Desktop/Data Science/Exploratory Data Analysis/household_power_consumption.txt"
myData <- read.table(myFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
setData <- myData[myData$Date %in% c("1/2/2007","2/2/2007") ,]

#store Data
globalactpow <- as.numeric(setData$Global_active_power)
time <- strptime(paste(setData$Date, setData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#create graph
png("plot2.png", width=480, height=480)
plot(time, globalactpow, type="l", xlab="", ylab="Global Active Power(kilowatts)")
dev.off()
