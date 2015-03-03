# plot1.R
# Reads power consumption data and creates a histogram
# Load package 'dplyr' so we can use filter() function
require(dplyr)

# Read the primary data file
# power <- read.csv("household_power_consumption.txt", sep = ";")

# For testing, read only filtered file
power <- read.csv("power_filter.csv")

# Change Date column to an r date class
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")

# Filter for only the dates we want
pf <- filter(power, Date == "2007-02-01" | Date == "2007-02-02")

# Create the png file
png("plot1.png")
plot(hf_hist, col = "Red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency")
dev.off()