library(readr)
library(lubridate)
library(dplyr)

file <- "household_power_consumption.txt"
power <- read_csv2(file = file)
power$Date <-dmy(power$Date)
power <- power %>% filter( Date >= date("2007-02-01") & Date <= date("2007-02-02") )

Global_active_power <- as.numeric(power$Global_active_power)


par(mfrow=c(1,1))

hist(Global_active_power,col='red',main= "Global Active Power", xlab="Global Active Power (Kilowatt)")

dev.copy(png,"Plot1.png",width = 480, height = 480, units = "px")

dev.off()
