#load data
tmp <- read.table("household_power_consumption.txt", sep = ";", skip =66637,
                  nrow = 2880,  na.strings = "?",
                  colClasses = c("character", "character","numeric","numeric","numeric"
                                 ,"numeric","numeric","numeric","numeric"))

#assign names
names(tmp) <- read.table("household_power_consumption.txt", 
                         sep = ";", nrows =1, colClasses = "character")

#open png graphic device
png(file = "plot2.png", width = 480, height = 480)

#set params
par(cex = 1, family ="sans")

#create plot
plot(strptime(paste(tmp$Date, tmp$Time), format = "%d/%m/%Y %H:%M:%S"),
      tmp$Global_active_power, type ="l", xlab = "", 
     ylab = "Global Active Power (kilowattes)")

#close graphic device 
dev.off()