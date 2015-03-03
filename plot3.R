# load data into R
power<- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
power <- power[power$Date %in% c("1/2/2007", "2/2/2007"), ]

# combine date and time variables and format to date/time object
power$DateTime <- paste(power$Date, power$Time)
power$DateTime <- strptime(power$DateTime, format="%d/%m/%Y %H:%M:%S")

# plot 3: lineplots of submetering 1,2,3 on same plot
png(file="plot3.png")
plot(power$DateTime, power$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
points(power$DateTime, power$Sub_metering_2, type="l", col="red")
points(power$DateTime, power$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"))
dev.off()