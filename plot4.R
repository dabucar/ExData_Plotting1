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

# Create the plot - prepare multiplot
par(mfrow = c(2,2))

# Plot upper-left; equal to plot2
plot(x = filtered.data$DateTime,
     y = filtered.data$Global_active_power,
     type = "n",  # do not plot anything here
     main = "",  # hide title
     xlab = "",  # hide x-axis label
     ylab = "Global Active Power")
lines(x = filtered.data$DateTime,
      y = filtered.data$Global_active_power)

# Plot upper-right
plot(x = filtered.data$DateTime,
     y = filtered.data$Voltage,
     type = "n",  # do not plot anything here
     main = "",  # hide title
     xlab = "",  # I left out the x-axis label on purpose, to match others
     ylab = "Voltage")
lines(x = filtered.data$DateTime,
      y = filtered.data$Voltage)

# Plot lower-left; equal to plot3
plot(x = filtered.data$DateTime,
     y = filtered.data$Sub_metering_1,  # "dummy" y-axis
     type = "n",  # do not plot anything here
     main = "",  # hide title
     xlab = "",  # hide x-axis label
     ylab = "Energy sub metering")
lines(x = filtered.data$DateTime,
      y = filtered.data$Sub_metering_1,
      col = "black")
lines(x = filtered.data$DateTime,
      y = filtered.data$Sub_metering_2,
      col = "red")
lines(x = filtered.data$DateTime,
      y = filtered.data$Sub_metering_3,
      col = "blue")
legend(x = "topright",
       legend = names(filtered.data)[7:9],
       col = c("black", "red", "blue"),
       lty = 1,
       pt.cex = 1,
       cex = 0.6,
       y.intersp = 0.3)

# Plot lower-right
plot(x = filtered.data$DateTime,
     y = filtered.data$Global_reactive_power,
     type = "n",  # do not plot anything here
     main = "",  # hide title
     xlab = "",  # I left out the x-axis label on purpose, to match others
     ylab = "Global reactive power")
lines(x = filtered.data$DateTime,
      y = filtered.data$Global_reactive_power)

# Save plot to png file
dev.copy(png, "plot4.png", width = 480, height = 480)
dev.off()