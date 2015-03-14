# File Name: plot3.R
# Input: summarySCC_PM25.rds (data file)
# Program assumes the data file is in the working directory
# Output: .png file showing a plot of PM2.5 Emissions for Baltimore City
# from four different sources.
# Need to add dir() to determine if the files exist first

# Read file - don't need source_class file for plot1.
NEI <- readRDS("summarySCC_PM25.rds")

# Pull only Baltimore City fips data
balt_city <- NEI[NEI$fips == "24510",]

# Split NEI on emissions by year
emissions_by_year <- with(balt_city, split(Emissions, year))

# Sum emissions for each year
sum_by_year <- lapply(emissions_by_year, sum)

avg_by_year_by_sensor <- lapply(emissions_by_year, mean)

# Open device to create .png file
png("plot2.png")

# Plot the values - total emission by year
# Hide x-axis labels so we can customize later to show 1999
plot(names(sum_by_year), sum_by_year, 
     ylab = "Total PM2.5 Emissions (tons)", 
     xlab = "Year",
     main = "PM2.5 Emissions by Year - Baltimore City",
     type = "n",
     xaxt = "n")

lines(names(sum_by_year), sum_by_year, col = "red")
lines(names(sum_by_year), avg_by_year_by_sensor, col = "blue")


# Add custom x-axis labels to show 1999 plus other years
axis(1, at=names(sum_by_year), labels=names(sum_by_year))

# Close device
dev.off()