#########
# Load libraries and data
#########
library(lubridate)
hpc <- read.table("household_power_consumption.txt", header = TRUE,
                  sep = ";", na.strings = "?")

##########
# Convert dates and filter to period of interest
##########
hpc[,1] <- dmy(hpc[,1])
hpc[,2] <- hms(hpc[,2])
hpc <- subset(hpc, hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02")

#########
# Open graphic device
########
png("plot1.png", 480, 480)

#########
# Make the plot
########

with(hpc, hist(Global_active_power, col = "red",
               main = "Global Activze Power",
               xlab = "Global Active Power (kilowatts)"))

#########
# Close graphic device
########
dev.off()