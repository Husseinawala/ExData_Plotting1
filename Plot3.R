library(readr)
library(lubridate)
library(dplyr)

file <- "household_power_consumption.txt"
power <- read_csv2(file = file)
power$Date <-dmy(power$Date)
power <- power %>% filter( Date >= date("2007-02-01") & Date <= date("2007-02-02") )

Global_active_power <- as.numeric(power$Global_active_power)
Sub_metering_1 <- as.numeric(power$Sub_metering_1)
Sub_metering_2 <- as.numeric(power$Sub_metering_2)
Sub_metering_3 <- as.numeric(power$Sub_metering_3)
Date_time <- as.POSIXct(paste(power$Date, power$Time), format="%Y-%m-%d %H:%M:%S")

par(mfrow=c(1,1))

plot(Date_time,Sub_metering_1,type="l",xlab="",ylab="Energy Sub Metering")
lines(Date_time,Sub_metering_2,col="red")
lines(Date_time,Sub_metering_3,col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       lty=1:1)

dev.copy(png,"Plot3.png",width = 480, height = 480, units = "px")
dev.off()