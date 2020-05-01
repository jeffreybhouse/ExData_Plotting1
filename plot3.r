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
png("plot3.png", 480, 480)

#########
# Make the plot
########

with(hpc, plot(date_time, Sub_metering_1, 
               ylab = "Energy sub metering",
               xlab = "", type = "n"))
with(hpc, lines(date_time, Sub_metering_1, lwd = 2))
with(hpc, lines(date_time, Sub_metering_2, lwd = 2, col = "red"))
with(hpc, lines(date_time, Sub_metering_3, lwd = 2, col = "blue"))
legend("topright", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        lty = "solid", lwd = 2)

#########
# Close graphic device
########
dev.off()