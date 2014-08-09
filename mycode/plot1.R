#Read data
date <- read.table("household_power_consumption.txt", sep=";", header= TRUE)[,1]
first <- which(date=="1/2/2007")
second <- which(date=="2/2/2007")
select_date <- append(first, second)
data <- read.table("household_power_consumption.txt", sep=";", header= TRUE)[select_date,]

#Transform Global_active_power into numeric class
data[,3] <- as.numeric(as.character(data[,3]))

#Plot
dev.copy(png, file = "plot1.png")
with(data, hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)"))
dev.off()