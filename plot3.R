# Going to download the data the we need.  First need to save the names
header <- read.table("household_power_consumption.txt", nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)

# Now we will read in the data the we need. 
Data <- read.table("household_power_consumption.txt", sep = ";", header = FALSE, skip = 66637, nrows = 2880, na.strings = "?")

# Put back in he header (column names)
colnames( Data ) <- unlist(header)

# Create Date/Time class of variable
z<-strptime(paste(Data$Date, Data$Time), "%d/%m/%Y %H:%M:%S")

png(file="plot3.png", width=480, height=480) ## Open PNG device and creates 'plot3.png' into working directory

#Now create the plot from the given Data. 
plot(z, Data$Sub_metering_1,type = "l", ylab = "Energy sub metering", xlab="", col = "black")
lines(z, Data$Sub_metering_2, col = "red")
lines(z, Data$Sub_metering_3, col = "blue")

legend("topright", lty = 1, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))

dev.off()  # Closes the PNG file device