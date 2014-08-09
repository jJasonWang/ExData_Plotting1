#Read data
date <- read.table("household_power_consumption.txt", sep=";", header= TRUE)[,1]
first <- which(date=="1/2/2007")
second <- which(date=="2/2/2007")
select_date <- append(first, second)
data <- read.table("household_power_consumption.txt", sep=";", header= TRUE)[select_date,]

#Transform Date and Time into Date class
x=paste(data[,1], data[,2])
date_time <- strptime(x, "%d/%m/%Y %H:%M:%S")

#Transform Global_active_power, Voltage, Global_reactive_power and Sub_metering_1,2,3 into numeric class
data[,3] <- as.numeric(as.character(data[,3]))
data[,4] <- as.numeric(as.character(data[,4]))
data[,5] <- as.numeric(as.character(data[,5]))
data[,7] <- as.numeric(as.character(data[,7]))
data[,8] <- as.numeric(as.character(data[,8]))
data[,9] <- as.numeric(as.character(data[,9]))

#Plot
dev.copy(png, file = "plot4.png")
par(mfrow=c(2,2))

#plot 1
with(data, plot(date_time, Global_active_power, type="l", xlab="", ylab="Global Active Power"))

#plot 2
with(data, plot(date_time, Voltage, type="l", xlab="datetime", ylab="Voltage"))

#plot 3 
with(data, plot(date_time, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(data, lines(date_time, Sub_metering_2, type="l", col="red"))
with(data, lines(date_time, Sub_metering_3, type="l", col="blue"))
legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plot 4
with(data, plot(date_time, Global_reactive_power, type="l", xlab="datetime"))
dev.off()