#load data
tmp <- read.table("household_power_consumption.txt", sep = ";", skip =66637,
                  nrow = 2880,  na.strings = "?",
                  colClasses = c("character", "character","numeric","numeric","numeric"
                                 ,"numeric","numeric","numeric","numeric"))
#assign names
names(tmp) <- read.table("household_power_consumption.txt", 
                         sep = ";", nrows =1, colClasses = "character")

#open png graphic device
png(file = "plot1.png", width = 480, height = 480)

#set params
par(cex = 1, family ="sans")

#create histogram
hist(tmp$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowattes)", col = "red")

#close graphic device
dev.off()
