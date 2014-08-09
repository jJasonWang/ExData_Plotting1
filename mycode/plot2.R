#Read data
date <- read.table("household_power_consumption.txt", sep=";", header= TRUE)[,1]
first <- which(date=="1/2/2007")
second <- which(date=="2/2/2007")
select_date <- append(first, second)
data <- read.table("household_power_consumption.txt", sep=";", header= TRUE)[select_date,]

#Transform Date and Time into Date class
x=paste(data[,1], data[,2])
date_time <- strptime(x, "%d/%m/%Y %H:%M:%S")

#Transform Global_active_power into numeric class
data[,3] <- as.numeric(as.character(data[,3]))

#Plot
dev.copy(png, file = "plot2.png")
with(data, plot(date_time, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()
