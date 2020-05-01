#########
# Load libraries and data
#########
library(lubridate)
hpc <- read.table("household_power_consumption.txt", header = TRUE,
                  sep = ";", na.strings = "?")

##########
# Convert dates and filter to period of interest
##########
hpc$date_time <- dmy_hms(paste(hpc$Date, hpc$Time))
hpc <- subset(hpc, year(date_time) == 2007
              & month(date_time) == 2
              & day(date_time) %in% c(1,2))
#########
# Open graphic device
########
png("plot2.png", 480, 480)

#########
# Make the plot
########

with(hpc, plot(date_time, Global_active_power, 
               ylab = "Global Active Power (kilowatts)",
               xlab = "", type = "n"))
with(hpc, lines(date_time, Global_active_power))

#########
# Close graphic device
########
dev.off()