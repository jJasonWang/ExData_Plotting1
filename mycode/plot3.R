#Read data
date <- read.table("household_power_consumption.txt", sep=";", header= TRUE)[,1]
first <- which(date=="1/2/2007")
second <- which(date=="2/2/2007")
select_date <- append(first, second)
data <- read.table("household_power_consumption.txt", sep=";", header= TRUE)[select_date,]

#Transform Date and Time into Date class
x=paste(data[,1], data[,2])
date_time <- strptime(x, "%d/%m/%Y %H:%M:%S")

#Sub_metering_1,2,3 into numeric class
data[,7] <- as.numeric(as.character(data[,7]))
data[,8] <- as.numeric(as.character(data[,8]))
data[,9] <- as.numeric(as.character(data[,9]))

#Plot
dev.copy(png, file = "plot3.png")
with(data, plot(date_time, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(data, lines(date_time, Sub_metering_2, type="l", col="red"))
with(data, lines(date_time, Sub_metering_3, type="l", col="blue"))
legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()