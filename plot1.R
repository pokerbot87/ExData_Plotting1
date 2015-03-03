# load data into R
power<- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
power <- power[power$Date %in% c("1/2/2007", "2/2/2007"), ]

# combine date and time variables and format to date/time object
power$DateTime <- paste(power$Date, power$Time)
power$DateTime <- strptime(power$DateTime, format="%d/%m/%Y %H:%M:%S")

# plot 1: histogram of global active power
png(file="plot1.png")
hist(power$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()