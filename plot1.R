#Exploratory data analysis
#Week 1 , first project 
# upload data 
unzip(zipfile = "./exdata_data_household_power_consumption.zip", exdir = getwd())
data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#extract the data 
as.Date(data$Date) # convert to date type 
strptime(data$Time, format = "%H:%M:%S") # convert to time type 
subdata <- subset(data, Date %in% c("1/2/2007","2/2/2007") )
#plot 1 
##Global active power
globalActivePower <- as.numeric(subdata$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
