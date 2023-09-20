
# examine how household energy usage varies over 2007-02-01 and 2007-02-02

# readig in the household_power_consumption.txt file
hpc <- read.table("household_power_consumption.txt", header = TRUE, 
         sep = ";", na.strings ="?")

#converting the Date and Time columns to correct type

hpc$Time <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %T")
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

feb1 <- as.Date("2007-02-01")
feb2 <- as.Date("2007-02-02")
subs <- subset(hpc, Date == feb1 | Date == feb2)

png("plot1.png", width = 480, height = 480, units = "px")
hist(subs$Global_active_power, col = "red", 
      main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
