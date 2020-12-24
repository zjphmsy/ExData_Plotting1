# Read data
Data <- read.csv("~/Desktop/household_power_consumption.txt", sep=";", na.strings="?")

# Subset data
Data$Date <- as.Date(Data$Date, "%d/%m/%Y")
Data_sub <- Data[Data$Date >= "2007-02-01" & Data$Date <= "2007-02-02",]

# Conversion
Data_sub$DataTime <- as.POSIXct(paste(Data_sub$Date, Data_sub$Time))

# Generate plot
quartz()
with(Data_sub, plot(Global_active_power ~ DataTime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))

# Export to PNG file
dev.print(png, file = "~/Desktop/R/plot2.png", width = 480, height = 480)
dev.off()
