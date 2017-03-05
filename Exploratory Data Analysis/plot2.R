# Data Processing
## Read the file
dataset <- read.table("household_power_consumption.txt", header = T, sep = ";")

## Converting to date data type
dataset$Date <- as.Date(dataset$Date,format = "%d/%m/%Y")

## Filtering data for specified date
dataset <- subset(dataset, Date >= as.Date("01-02-2007",format = "%d-%m-%Y") & Date <= as.Date("02-02-2007",format = "%d-%m-%Y"))

## Creating DateTime object
dataset$dt <- strptime(paste(dataset$Date, dataset$Time), format = "%Y-%m-%d %H:%M:%S")

# Plot Lines
par(mar = c(4,4,2,2))
par(mfrow = c(1,1))
plot(dataset$dt,dataset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(Kilowatts)")