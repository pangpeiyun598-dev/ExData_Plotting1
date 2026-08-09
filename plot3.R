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

# Create plot3.png
png("plot3.png", width = 480, height = 480)

# First line: Sub_metering_1
plot(
  power2$datetime,
  power2$Sub_metering_1,
  type = "l",
  xlab = "",
  ylab = "Energy sub metering",
  xaxt = "n"
)

# Add Sub_metering_2
lines(
  power2$datetime,
  power2$Sub_metering_2,
  col = "red"
)

# Add Sub_metering_3
lines(
  power2$datetime,
  power2$Sub_metering_3,
  col = "blue"
)

# Add Thu, Fri, Sat labels
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

# Add legend
legend(
  "topright",
  legend = c(
    "Sub_metering_1",
    "Sub_metering_2",
    "Sub_metering_3"
  ),
  col = c("black", "red", "blue"),
  lty = 1
)

dev.off()