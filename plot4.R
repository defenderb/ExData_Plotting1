#load data
tmp <- read.table("household_power_consumption.txt", sep = ";", skip =66637,
                  nrow = 2880,  na.strings = "?",
                  colClasses = c("character", "character","numeric","numeric","numeric"
                                 ,"numeric","numeric","numeric","numeric"))

#assign names
names(tmp) <- read.table("household_power_consumption.txt", 
                         sep = ";", nrows =1, colClasses = "character")

#open png graphic device
png(file = "plot4.png", width = 480, height = 480) 

#set params
par(cex.axis = 0.9, family ="sans", mfrow = c(2, 2), cex.lab = 0.9, cex = 0.8)

# data for x
x<- strptime(paste(tmp$Date, tmp$Time), format = "%d/%m/%Y %H:%M:%S")

# create plot #1
plot(x, tmp$Global_active_power, type ="l", xlab = "", 
     ylab = "Global Active Power")

# create plot #2
plot(x, tmp$Voltage, type ="l", xlab = "datetime", 
     ylab = "Voltage")

# create plot #3
plot(x, tmp$Sub_metering_1, type ="l", xlab = "", 
     ylab = "Energy sub metering" )
lines(x, tmp$Sub_metering_2, col ="red")
lines(x, tmp$Sub_metering_3, col ="blue")
legend("topright", lty =1, bty="n",
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# create plot #4
plot(x, tmp$Global_reactive_power, type ="l", xlab = "", 
     ylab = "Global_reactive_power" )

#close graphic device 
dev.off()
