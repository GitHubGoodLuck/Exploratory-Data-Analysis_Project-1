library("data.table")

setwd("~/Desktop/Exploratory_Data_Analysis/project1/data")

#Reads in data from file then subsets data for specified dates
power <- read.table("household_power_consumption.txt",skip=1,sep=";")

# Adding column names
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power",
                  "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2",
                  "Sub_metering_3")

# Change Date Column to Date Type
power[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Filter Dates for 2007-02-01 and 2007-02-02
power <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")


## Plot 1
hist(as.numeric(as.character(power$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

# Adding title
title(main="Global Active Power")

dev.off()