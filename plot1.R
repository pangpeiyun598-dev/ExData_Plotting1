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

# Create plot1.png
png("plot1.png", width = 480, height = 480)

hist(
  power2$Global_active_power,
  col = "red",
  main = "Global Active Power",
  xlab = "Global Active Power (kilowatts)"
)

dev.off()