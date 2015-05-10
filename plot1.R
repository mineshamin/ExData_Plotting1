setwd("/home/minesh/Documents/R_Files/Exploratory_Data_Analysis_Course/AssignmentOne")

# Going to download the data the we need.  First need to save the names
header <- read.table("household_power_consumption.txt", nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)

# Now we will read in the data the we need. 
Data <- read.table("household_power_consumption.txt", sep = ";", header = FALSE, skip = 66637, nrows = 2880, na.strings = "?")

# Put back in he header (column names)
colnames( Data ) <- unlist(header)

png(file="plot1.png", width=480, height=480) ## Open PNG device and creates 'plot1.png' into working directory

#Now create the histogram from the given Data. 
with(Data, hist(Global_active_power, col="red",  xlab = "Global Active Power (kilowatts)", main ="Global Active Power"))

dev.off()  # Closes the PNG file device
