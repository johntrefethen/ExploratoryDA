# Read files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Split NEI on emissions by year
emissions_by_year <- with(NEI, split(Emissions, year))

# Sum emissions for each year
sum_by_year <- lapply(emissions_by_year, sum)

# Create a vector of years for plotting
years <- c("1999", "2002", "2005", "2008")

# Open device
png("plot1.png")

# Plot the values
plot(years, sum_by_year, ylab = "Total PM2.5 Emission", xlab = "Year", type = "l")

# Close device
dev.off()

# Plot the values
plot(years, sum_by_year, ylab = "Total PM2.5 Emission", xlab = "Year", type = "l")

