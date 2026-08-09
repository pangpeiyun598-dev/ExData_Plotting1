# Read the data
power <- read.table(
  "household_power_consumption.txt",
  header = TRUE,
  sep = ";",
  na.strings = "?"
)

# Keep only February 1 and February 2, 2007
power2 <- subset(
  power,
  Date %in% c("1/2/2007", "2/2/2007")
)

# Create datetime variable
power2$datetime <- strptime(
  paste(power2$Date, power2$Time),
  format = "%d/%m/%Y %H:%M:%S"
)

# Create plot4.png
png("plot4.png", width = 480, height = 480)

# Arrange plots in 2 rows and 2 columns
par(mfrow = c(2, 2))

# Plot 1: Global Active Power
plot(
  power2$datetime,
  power2$Global_active_power,
  type = "l",
  xlab = "",
  ylab = "Global Active Power",
  xaxt = "n"
)

axis(
  1,
  at = as.POSIXct(
    c(
      "2007-02-01 00:00:00",
      "2007-02-02 00:00:00",
      "2007-02-03 00:00:00"
    )
  ),
  labels = c("Thu", "Fri", "Sat")
)

# Plot 2: Voltage
plot(
  power2$datetime,
  power2$Voltage,
  type = "l",
  xlab = "datetime",
  ylab = "Voltage",
  xaxt = "n"
)

axis(
  1,
  at = as.POSIXct(
    c(
      "2007-02-01 00:00:00",
      "2007-02-02 00:00:00",
      "2007-02-03 00:00:00"
    )
  ),
  labels = c("Thu", "Fri", "Sat")
)

# Plot 3: Energy sub metering
plot(
  power2$datetime,
  power2$Sub_metering_1,
  type = "l",
  xlab = "",
  ylab = "Energy sub metering",
  xaxt = "n"
)

lines(
  power2$datetime,
  power2$Sub_metering_2,
  col = "red"
)

lines(
  power2$datetime,
  power2$Sub_metering_3,
  col = "blue"
)

axis(
  1,
  at = as.POSIXct(
    c(
      "2007-02-01 00:00:00",
      "2007-02-02 00:00:00",
      "2007-02-03 00:00:00"
    )
  ),
  labels = c("Thu", "Fri", "Sat")
)

legend(
  "topright",
  legend = c(
    "Sub_metering_1",
    "Sub_metering_2",
    "Sub_metering_3"
  ),
  col = c("black", "red", "blue"),
  lty = 1,
  bty = "n"
)

# Plot 4: Global Reactive Power
plot(
  power2$datetime,
  power2$Global_reactive_power,
  type = "l",
  xlab = "datetime",
  ylab = "Global_reactive_power",
  xaxt = "n"
)

axis(
  1,
  at = as.POSIXct(
    c(
      "2007-02-01 00:00:00",
      "2007-02-02 00:00:00",
      "2007-02-03 00:00:00"
    )
  ),
  labels = c("Thu", "Fri", "Sat")
)

dev.off()