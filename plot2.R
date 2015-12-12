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

# Create the plot
plot(x = filtered.data$DateTime,
     y = filtered.data$Global_active_power,
     type = "n",  # do not plot anything here
     main = "",  # hide title
     xlab = "",  # hide x-axis label
     ylab = "Global Active Power (kilowatts)")
lines(x = filtered.data$DateTime,
      y = filtered.data$Global_active_power)

# Save plot to png file
dev.copy(png, "plot2.png", width = 480, height = 480)
dev.off()