## Read in complete data file from working directory

data <- read.csv("household_power_consumption.txt", sep=";",header=TRUE,
                 stringsAsFactors=FALSE, na.strings="?")

## Convert date format and subset the data

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
sub_data <- subset(data, Date > "2007-01-31" & Date < "2007-02-03")

## Create the plot in a png file

png(filename="plot1.png", width=480, height=480, units="px")
hist(sub_data$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()