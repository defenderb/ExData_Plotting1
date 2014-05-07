#load data
tmp <- read.table("household_power_consumption.txt", sep = ";", skip =66637,
                  nrow = 2880,  na.strings = "?",
                  colClasses = c("character", "character","numeric","numeric","numeric"
                                 ,"numeric","numeric","numeric","numeric"))

#assign names
names(tmp) <- read.table("household_power_consumption.txt", 
                         sep = ";", nrows =1, colClasses = "character")

#open png graphic device
png(file = "plot3.png", width = 480, height = 480)

#set params
par(cex = 1, family ="sans")

# data for x
x <- strptime(paste(tmp$Date, tmp$Time), format = "%d/%m/%Y %H:%M:%S")

# create plot
plot(x, tmp$Sub_metering_1, type ="l", xlab = "", 
     ylab = "Energy sub metering" )
lines(x, tmp$Sub_metering_2, col ="red")
lines(x, tmp$Sub_metering_3, col ="blue")
legend("topright", lty =1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


#close graphic device 
dev.off()