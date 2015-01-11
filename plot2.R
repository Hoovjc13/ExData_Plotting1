## Read in complete data file from working directory

data <- read.csv("household_power_consumption.txt", sep=";",header=TRUE,
                 stringsAsFactors=FALSE, na.strings="?")

## Convert date format, subset data, and create date and time data for plot2

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
sub_data <- subset(data, Date > "2007-01-31" & Date < "2007-02-03")
sub_data$Dateandtime <- as.POSIXct(paste(sub_data$Date, sub_data$Time))

## Create plot2 in a png file

png(filename="plot2.png", width=480, height=480, units="px")
plot(sub_data$Global_active_power~sub_data$Dateandtime, type="l", xlab="",
     ylab="Global Active Power (kilowatts)") 
dev.off()