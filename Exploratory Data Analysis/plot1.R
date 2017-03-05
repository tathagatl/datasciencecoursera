# Data Processing
## Read the file
dataset <- read.table("household_power_consumption.txt", header = T, sep = ";")

## Converting to date data type
dataset$Date <- as.Date(dataset$Date,format = "%d/%m/%Y")

## Filtering data for specified date
dataset <- subset(dataset, Date >= as.Date("01-02-2007",format = "%d-%m-%Y") & Date <= as.Date("02-02-2007",format = "%d-%m-%Y"))

## Creating DateTime object
dataset$dt <- strptime(paste(dataset$Date, dataset$Time), format = "%Y-%m-%d %H:%M:%S")

# Plot histogram
par(mar = c(4,4,2,2))
par(mfrow = c(1,1))
hist(as.numeric(levels(dataset$Global_active_power))[dataset$Global_active_power], xlab = "Global Active Power (Kilowatts)", main = "Global Active Power", col = "red")