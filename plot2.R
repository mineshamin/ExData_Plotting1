# Going to download the data the we need.  First need to save the names
header <- read.table("household_power_consumption.txt", nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)

# Now we will read in the data the we need. 
Data <- read.table("household_power_consumption.txt", sep = ";", header = FALSE, skip = 66637, nrows = 2880, na.strings = "?")

# Put back in he header (column names)
colnames( Data ) <- unlist(header)

# Create Date/Time class of variable
z<-strptime(paste(Data$Date, Data$Time), "%d/%m/%Y %H:%M:%S")

png(file="plot2.png", width=480, height=480) ## Open PNG device and creates 'plot2.png' into working directory

#Now create the plot from the given Data. 
plot(z, Data$Global_active_power,type = "l", ylab = "Global Active Power (kilowatts)", xlab="")

dev.off()  # Closes the PNG file device