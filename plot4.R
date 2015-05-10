# Going to download the data the we need.  First need to save the names
header <- read.table("household_power_consumption.txt", nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)

# Now we will read in the data the we need. 
Data <- read.table("household_power_consumption.txt", sep = ";", header = FALSE, skip = 66637, nrows = 2880, na.strings = "?")

# Put back in he header (column names)
colnames( Data ) <- unlist(header)

# Create Date/Time class of variable
z<-strptime(paste(Data$Date, Data$Time), "%d/%m/%Y %H:%M:%S")

png(file="plot4.png", width=480, height=480) ## Open PNG device and creates 'plot4.png' into working directory

par(mfrow = c(2,2))  ## Makes 2x2 of plots going clockwise 

# Create the first plot from the given Data. 
plot(z, Data$Global_active_power,type = "l", ylab = "Global Active Power", xlab="")

# Create the second plot from the given Data. 
plot(z, Data$Voltage,type = "l", ylab = "Voltage", xlab="datetime")

# Create the third plot from the given Data. 
plot(z, Data$Sub_metering_1,type = "l", ylab = "Energy sub metering", xlab="", col = "black")
lines(z, Data$Sub_metering_2, col = "red")
lines(z, Data$Sub_metering_3, col = "blue")

legend("topright", bty = "n", lty = 1, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))

# Create the fourth plot from the given Data. 
plot(z, Data$Global_reactive_power,type = "l", ylab = "Global_reactive_power", xlab="datetime")

dev.off()  # Closes the PNG file device