# Data Processing
## Read the file
dataset <- read.table("household_power_consumption.txt", header = T, sep = ";")

## Converting to date data type
dataset$Date <- as.Date(dataset$Date,format = "%d/%m/%Y")

## Filtering data for specified date
dataset <- subset(dataset, Date >= as.Date("01-02-2007",format = "%d-%m-%Y") & Date <= as.Date("02-02-2007",format = "%d-%m-%Y"))

## Creating DateTime object
dataset$dt <- strptime(paste(dataset$Date, dataset$Time), format = "%Y-%m-%d %H:%M:%S")

# Master Plot
par(mar=c(2,5,2,5))
par(mfrow=c(2,2))
plot(dataset$dt,dataset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(Kilowatts)", cex.lab = 0.5)
plot(dataset$dt,dataset$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(dataset$dt,dataset$Sub_metering_1, type = "l", xlab = "", ylab = "Sub Metering",cex.lab = 0.7)
lines(dataset$dt,dataset$Sub_metering_2, type = "l", xlab = "", ylab = "Sub Metering", col = "red")
lines(dataset$dt,dataset$Sub_metering_3, type = "l", xlab = "", ylab = "Sub Metering", col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","blue","red"),cex = 0.4)
plot(dataset$dt,dataset$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power",cex.lab = 0.6)