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
png("plot4.png", 480, 480)

#########
# Make the plots, one at a time
########

# first set the frame up for four charts
par(mfrow = c(2, 2))

# first plot - same as plot2.png:
with(hpc, plot(date_time, Global_active_power, 
               ylab = "Global Active Power",
               xlab = "", type = "n"))
with(hpc, lines(date_time, Global_active_power))

# second plot - same as plot2.png:
with(hpc, plot(date_time, Voltage, 
               ylab = "Voltage",
               xlab = "datetime", type = "n"))
with(hpc, lines(date_time, Voltage))

# third plot - same as plot3.png
with(hpc, plot(date_time, Sub_metering_1, 
               ylab = "Energy sub metering",
               xlab = "", type = "n"))
with(hpc, lines(date_time, Sub_metering_1, lwd = 2))
with(hpc, lines(date_time, Sub_metering_2, lwd = 2, col = "red"))
with(hpc, lines(date_time, Sub_metering_3, lwd = 2, col = "blue"))
legend("topright", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = "solid", lwd = 2, bty = "n")

# fourth plot
with(hpc, plot(date_time, Global_reactive_power, 
               xlab = "datetime", type = "n"))
with(hpc, lines(date_time, Global_reactive_power))

#########
# Close graphic device
########
dev.off()