myFile <- "C:/Users/xdriz/Desktop/Data Science/Exploratory Data Analysis/household_power_consumption.txt"
myData <- read.table(myFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
setData <- myData[myData$Date %in% c("1/2/2007","2/2/2007") ,]

#store Data
globalactpow <- as.numeric(setData$Global_active_power)

#create Graph
png("plot1.png", width=480, height=480)
hist(globalactpow, col="orange", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
