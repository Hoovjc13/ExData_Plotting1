## Read in complete data file from working directory

data <- read.csv("household_power_consumption.txt", sep=";",header=TRUE,
                 stringsAsFactors=FALSE, na.strings="?")

## Convert date format, subset data, and create date and time data for plot4

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
sub_data <- subset(data, Date > "2007-01-31" & Date < "2007-02-03")
sub_data$Dateandtime <- as.POSIXct(paste(sub_data$Date, sub_data$Time))

## Create plot4 in a png file

png(filename="plot4.png", width=480, height=480, units="px")
par(mfcol = c(2,2))
with(sub_data, {
        plot(Global_active_power~Dateandtime, type="l", xlab="", 
             ylab="Global Active Power")
        plot(Sub_metering_1~Dateandtime, type="l", xlab="", 
             ylab="Energy sub metering")
        lines(Dateandtime, Sub_metering_2, type="l", col="red")
        lines(Dateandtime, Sub_metering_3, type="l", col="blue")
        legend("topright", cex=0.9, legend=c("Sub_metering_1","Sub_metering_2",
                "Sub_metering_3"), lwd=1, bty="n", col=c("black","red","blue"))
        plot(Voltage~Dateandtime, type="l", xlab="datetime", ylab=("Voltage"))
        plot(Global_reactive_power~Dateandtime, type="l", xlab="datetime")
})
dev.off()