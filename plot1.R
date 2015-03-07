# plot1.R
# Reads power consumption data and creates a .png file with a histogram
# of Global Active Power by Date/Time
## The code assumes that the household_power_consumption.txt file is in the
# Local working directory.
# Load package 'dplyr' so we can use filter() function
require(dplyr)

# Read the primary data file
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

# Build the histogram
pf_hist <- hist(pf$Global_active_power, nclass = 12, plot = FALSE)

# Create the png file by opening a device and plotting the histogram
png("plot1.png")

# Plot
plot(pf_hist, col = "Red", main = "Global Active Power", 
     ylab = "Global Active Power (kilowatts)", 
     xlab = "Frequency")

# Close the device
dev.off()

# Print output to console for review - for testing purposes only
# plot(pf_hist, col = "Red", main = "Global Active Power", 
#    xlab = "Global Active Power (kilowatts)", 
#     ylab = "Frequency")