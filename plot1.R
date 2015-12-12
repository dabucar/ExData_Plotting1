# Load data
# This might take a few minutes, since I don't filter only for rows we will use
data <- read.csv(file = "household_power_consumption.txt", 
                 header = TRUE, 
                 sep = ";",
                 na.strings = "?")

# Create a unified DateTime variable
data$DateTime <- as.POSIXct(x = paste0(data$Date, "-", data$Time),
                            format = "%d/%m/%Y-%H:%M:%S")

# Filter for only the two desired dates
filtered.data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

# Create the histogram with desired features
hist(x = filtered.data$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")

# Save plot to png file
dev.copy(png, "plot1.png", width = 480, height = 480)
dev.off()
