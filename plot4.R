library(dplyr)

# Read data
Data <- read.csv("~/Desktop/household_power_consumption.txt", sep=";", na.strings="?")

# Subset data
Data$Date <- as.Date(Data$Date, "%d/%m/%Y")
Data_sub <- Data[Data$Date >= "2007-02-01" & Data$Date <= "2007-02-02",]

# Conversion
Data_sub$DateTime <- as.POSIXct(paste(Data_sub$Date, Data_sub$Time))

# Generate plot
quartz()
par(mfrow = c(2,2))
with(Data_sub,{
     plot(Global_active_power ~ DateTime, type = "l", ylab = "Global Active Power", xlab = "")
     plot(Voltage ~ DateTime, type = "l", ylab = "Voltage", xlab = "datatime")
     plot(Sub_metering_1 ~ DateTime, col="black", type = "l", ylab = "Energy sub metering", xlab = "")
        lines(Sub_metering_2 ~ DateTime, col = "red")
        lines(Sub_metering_3 ~ DateTime, col = "blue")
        legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
     plot(Global_reactive_power ~ DateTime, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
     })

# Export to PNG file
dev.print(png, file = "~/Desktop/R/plot4.png", width = 480, height = 480)
dev.off()
