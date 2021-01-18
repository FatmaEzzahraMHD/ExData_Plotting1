#Exploratory data analysis
#Week 1 , first project 
# upload data 
unzip(zipfile = "./exdata_data_household_power_consumption.zip", exdir = getwd())
data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#extract the data 
as.Date(data$Date) # convert to date type 
strptime(data$Time, format = "%H:%M:%S") # convert to time type 
subdata <- subset(data, Date %in% c("1/2/2007","2/2/2007") )
#plot 4
globalActivePower <- as.numeric(subdata$Global_active_power)
datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalreactivepower <- as.numeric(subdata$Global_reactive_power)
subMetering1 <- as.numeric(subdata$Sub_metering_1)
subMetering2 <- as.numeric(subdata$Sub_metering_2)
subMetering3 <- as.numeric(subdata$Sub_metering_3)
voltage <- as.numeric(subdata$Voltage)
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datetime, globalreactivepower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
