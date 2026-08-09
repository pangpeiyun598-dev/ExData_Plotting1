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

# Create plot2.png
png("plot2.png", width = 480, height = 480)

plot(
  power2$datetime,
  power2$Global_active_power,
  type = "l",
  xlab = "",
  ylab = "Global Active Power (kilowatts)",
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