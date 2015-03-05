# plot2.R
# Reads power consumption data and creates a histogram
# Load package 'dplyr' so we can use filter() function
require(dplyr)

# Read the primary data file
# Assumes user has unzipped the source file to their
# working directory.
power <- read.table("household_power_consumption.txt", 
                     header = TRUE, sep = ";", na.strings = "?", 
                     colClasses = c("Global_active_power" = "numeric"))

# Change Date column to an r date class
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")

# Filter for only the dates we want
pf <- filter(power, Date == "2007-02-01" | Date == "2007-02-02")

# Combine Date and Time into a single value
timedt <- as.POSIXct(paste(pf$Date, pf$Time))

# Create the png file - open device
png("plot2.png")

# Create the plot
plot(timedt, pf$Global_active_power, type = "l", 
     ylab = "Global Active Power (kilowatts)", xlab = "")

# Close the device
dev.off()

# Print output to console
plot(timedt, pf$Global_active_power, type = "l", 
     ylab = "Global Active Power (kilowatts)", xlab = "")