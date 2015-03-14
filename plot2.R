# File Name: plot2.R
# Input: summarySCC_PM25.rds (data file)
# Program assumes the data file is in the working directory
# Output: .png file showing a plot of Total PM2.5 Emissions for Baltimore City

# Read file - don't need source_class file for plot1.
# Check that it is in the working directory first
if(file.exists("summarySCC_PM25.rds")) {
    NEI <- readRDS("summarySCC_PM25.rds") 
} else {
    stop("No file exists")
}

# Pull only Baltimore City fips data
balt_city <- NEI[NEI$fips == "24510",]

# Split NEI on emissions by year
emissions_by_year <- with(balt_city, split(Emissions, year))

# Build the data sets to show sum, mean, and median for Baltimore Citys
# This should give a more rounded view of the decrease of PM2.5 Emissions 
# between 1999 and 2008.

# Sum emissions for each year
sum_by_year <- lapply(emissions_by_year, sum)
# Mean emissions for each year
mean_by_year <- lapply(emissions_by_year, mean)
# Median emissions for each year
med_by_year <- lapply(emissions_by_year, median)

# Open device to create .png file
png("plot2.png")

# Set plot to have 3 charts
par(mfrow = c(3,1))

# Plot the values - total emission by year
# Hide x-axis labels so we can customize later to show 1999
plot(names(sum_by_year), sum_by_year, 
     ylab = "Total PM2.5 Emissions (tons)", 
     xlab = "Year",
     main = "Total PM2.5 Emissions by Year - Baltimore City",
     type = "b",
     xaxt = "n")

# Add custom x-axis labels to show 1999 plus other years
axis(1, at=names(sum_by_year), labels=names(sum_by_year))

# Capture the median values 
plot(names(med_by_year), med_by_year, 
     ylab = "PM2.5 Emissions (tons)", 
     xlab = "Year",
     main = "Mean (by data points/year) PM2.5 Emissions by Year - Baltimore City",
     type = "b",
     xaxt = "n")

axis(1, at=names(med_by_year), labels=names(med_by_year))

# Plot the mean values by row for each year
plot(names(mean_by_year), mean_by_year, 
     ylab = "PM2.5 Emissions (tons)", 
     xlab = "Year",
     main = "Median (by data points/year) PM2.5 Emissions by Year - Baltimore City",
     type = "b",
     xaxt = "n")

axis(1, at=names(mean_by_year), labels=names(mean_by_year))

# Close device
dev.off()