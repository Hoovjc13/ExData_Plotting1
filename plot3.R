## Read in complete data file from working directory

data <- read.csv("household_power_consumption.txt", sep=";",header=TRUE,
                 stringsAsFactors=FALSE, na.strings="?")

## Convert date format, subset data, and create date and time data for plot3

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
sub_data <- subset(data, Date > "2007-01-31" & Date < "2007-02-03")
sub_data$Dateandtime <- as.POSIXct(paste(sub_data$Date, sub_data$Time))

## Create plot3 in a png file

png(filename="plot3.png", width=480, height=480, units="px")
plot(sub_data$Sub_metering_1 ~ sub_data$Dateandtime, type="l", xlab="",
     ylab="Energy sub metering")
lines(sub_data$Dateandtime, sub_data$Sub_metering_2, type="l", col="red")
lines(sub_data$Dateandtime, sub_data$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lwd=1, col=c("black","red","blue"))
dev.off()