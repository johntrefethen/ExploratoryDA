# plot3.R
# Reads power consumption data and creates a histogram
# Load package 'dplyr' so we can use filter() function
require(dplyr)

# Read the primary data file
# Assumes user has unzipped the source file to their
# working directory.
power <- read.table("household_power_consumption.txt", 
                    header = TRUE, sep = ";", na.strings = "?", 
                    colClasses = c("Date" = "character", 
                                   "Time" = "character",
                                   "Global_active_power" = "numeric",
                                   "Global_reactive_power" = "numeric",
                                   "Voltage" = "numeric",
                                   "Global_intensity" = "numeric",
                                   "Sub_metering_1" = "numeric",
                                   "Sub_metering_2" = "numeric",
                                   "Sub_metering_3" = "numeric"))

# Change Date column to an r date class
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")

# Filter for only the dates we want
pf <- filter(power, Date == "2007-02-01" | Date == "2007-02-02")

# Combine Date and Time into a single value
timedt <- as.POSIXct(paste(pf$Date, pf$Time))

# Create the png file - open device
png("plot4.png")

# Set the grid of plots
par(mfrow = c(2,2))

# Add Plot 1
plot(timedt, pf$Global_active_power, type = "l", 
     ylab = "Global Active Power", xlab = "")

# Add Plot 2
plot(timedt, pf$Voltage, type = "l", 
     ylab = "Voltage", xlab = "datetime")

# Add Plot 3
plot(timedt, pf$Sub_metering_1, type="n", ylab = "Energy sub metering", 
     xlab = " ")

# Add the lines for Plot 3
lines(timedt, pf$Sub_metering_1)
lines(timedt, pf$Sub_metering_2, col = "red")
lines(timedt, pf$Sub_metering_3, col = "blue")

#Add the legend for Plot 3
# legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pch = "-")
legend("topright", 
       c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1), 
       lwd=c(1,1),
       col=c("black","blue","red"))

# Add Plot 4
plot(timedt, pf$Global_reactive_power, type = "l", 
     ylab = "Global_reactive_power", xlab = "datetime")

# Close the device
dev.off()

par(mfrow = c(2,2))

# Add Plot 1
plot(timedt, pf$Global_active_power, type = "l", 
     ylab = "Global Active Power", xlab = "")

# Add Plot 2
plot(timedt, pf$Voltage, type = "l", 
     ylab = "Voltage", xlab = "datetime")

# Add Plot 3
plot(timedt, pf$Sub_metering_1, type="n", ylab = "Energy sub metering", 
     xlab = " ")

# Add the lines for Plot 3
lines(timedt, pf$Sub_metering_1)
lines(timedt, pf$Sub_metering_2, col = "red")
lines(timedt, pf$Sub_metering_3, col = "blue")

#Add the legend for Plot 3
# legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pch = "-")
legend("topright", 
       c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1), 
       lwd=c(1,1),
       col=c("black","blue","red"))

# Add Plot 4
plot(timedt, pf$Global_reactive_power, type = "l", 
     ylab = "Global_reactive_power", xlab = "datetime")