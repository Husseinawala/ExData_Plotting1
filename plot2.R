library(readr)
library(lubridate)
library(dplyr)

file <- "household_power_consumption.txt"
power <- read_csv2(file = file)
power$Date <-dmy(power$Date)
power <- power %>% filter( Date >= date("2007-02-01") & Date <= date("2007-02-02") )

Global_active_power <- as.numeric(power$Global_active_power)
Date_time <- as.POSIXct(paste(power$Date, power$Time), format="%Y-%m-%d %H:%M:%S")

par(mfrow=c(1,1))

plot(Date_time,Global_active_power,type="l",xlab="",ylab="Global Active Power (Kilowatt)")

dev.copy(png,"Plot2.png",width = 480, height = 480, units = "px")
dev.off()
