# File Name: plot1.R
# Input: summarySCC_PM25.rds (data file)
# Program assumes the data file is in the working directory
# Output: .png file showing a plot of Total PM2.5 Emissions for available years

# Read file - don't need source_class file for plot1.
NEI <- readRDS("summarySCC_PM25.rds")

# Split NEI on emissions by year
emissions_by_year <- with(NEI, split(Emissions, year))

# Sum emissions for each year
sum_by_year <- lapply(emissions_by_year, sum)

# Open device to create .png file
png("plot1.png")

# Plot the values - total emission by year
# Hide x-axis labels so we can customize later to show 1999
plot(names(sum_by_year), sum_by_year, 
     ylab = "Total PM2.5 Emissions (tons)", 
     xlab = "Year",
     main = "PM2.5 Emissions by Year",
     type = "b",
     xaxt = "n")

# Add custom x-axis labels to show 1999 plus other years
axis(1, at=names(sum_by_year), labels=names(sum_by_year))

# Close device
dev.off()