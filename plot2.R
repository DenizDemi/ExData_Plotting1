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

png("plot2.png", width = 480, height = 480, units = "px")
timeList <- c(as.double(min(subs$Time)), as.double(median(subs$Time)), 
              as.double(max(subs$Time)))
dayList <- c("Thu", "Fri", "Sat")
with(subs, plot(Time, Global_active_power, type = "l", 
                xaxt = "n", xlab = "", 
                ylab="Global Active Power (kilowatts)"))

axis(1, at= timeList, 
          labels = dayList)


dev.off()