library("data.table")

setwd("~/Desktop/Exploratory_Data_Analysis/project1/data")

#Reads in data from file then subsets data for specified dates
power <- read.table("household_power_consumption.txt",skip=1,sep=";")

# Adding column names
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power",
                  "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2",
                  "Sub_metering_3")

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
power$Time <- strptime(power$Time, format="%H:%M:%S")
power[1:1440,"Time"] <- format(power[1:1440,"Time"],"2007-02-01 %H:%M:%S")
power[1441:2880,"Time"] <- format(power[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# Filter Dates for 2007-02-01 and 2007-02-02
power <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")


## Plot 2
plot(power$Time,as.numeric(as.character(power$Global_active_power)),type="l",
     xlab="",ylab="Global Active Power (kilowatts)") 

# Adding title
title(main="Global Active Power Vs Time")

dev.off()