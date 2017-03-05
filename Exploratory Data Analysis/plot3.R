# Data Processing
## Read the file
dataset <- read.table("household_power_consumption.txt", header = T, sep = ";")

## Converting to date data type
dataset$Date <- as.Date(dataset$Date,format = "%d/%m/%Y")

## Filtering data for specified date
dataset <- subset(dataset, Date >= as.Date("01-02-2007",format = "%d-%m-%Y") & Date <= as.Date("02-02-2007",format = "%d-%m-%Y"))

## Creating DateTime object
dataset$dt <- strptime(paste(dataset$Date, dataset$Time), format = "%Y-%m-%d %H:%M:%S")

# Plot Submetering
par(mar = c(4,4,2,2))
par(mfrow = c(1,1))
plot(dataset$dt,dataset$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering")
lines(dataset$dt,dataset$Sub_metering_2, type = "l", col = "red")
lines(dataset$dt,dataset$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","blue","red"),cex = 0.4)
