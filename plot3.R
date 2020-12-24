# Read data
Data <- read.csv("~/Desktop/household_power_consumption.txt", sep=";", na.strings="?")

# Subset data
Data$Date <- as.Date(Data$Date, "%d/%m/%Y")
Data_sub <- Data[Data$Date >= "2007-02-01" & Data$Date <= "2007-02-02",]

# Conversion
Data_sub$DateTime <- as.POSIXct(paste(Data_sub$Date, Data_sub$Time))

# Generate plot
quartz()
plot(Data_sub$Sub_metering_1 ~ Data_sub$DateTime, col="black", type = "l", ylab = "Energy sub metering", xlab = "")
lines(Data_sub$Sub_metering_2 ~ Data_sub$DateTime, col = "red")
lines(Data_sub$Sub_metering_3 ~ Data_sub$DateTime, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Export to PNG file
dev.print(png, file = "~/Desktop/R/plot3.png", width = 480, height = 480)
dev.off()
