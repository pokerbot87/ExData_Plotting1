# load data into R
power<- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
power <- power[power$Date %in% c("1/2/2007", "2/2/2007"), ]

# combine date and time variables and format to date/time object
power$DateTime <- paste(power$Date, power$Time)
power$DateTime <- strptime(power$DateTime, format="%d/%m/%Y %H:%M:%S")

png(file="plot4.png")
par(mfcol=c(2,2))

plot(power$DateTime, power$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

plot(power$DateTime, power$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
points(power$DateTime, power$Sub_metering_2, type="l", col="red")
points(power$DateTime, power$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"))

plot(power$DateTime, power$Voltage, type="l", xlab="DateTime", ylab="Voltage")
plot(power$DateTime, power$Global_reactive_power, type="l", xlab="DateTime", ylab="Global_reactive_power")

dev.off()