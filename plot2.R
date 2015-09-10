## set my local working directory
setwd("C:/Users/Bill/Dropbox/R/ExData_Plotting1b/ExData_Plotting1")

## read the external file 
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 

## subset the data for the 2 desired days - 
## note:  Date is in DD/MM/YYYY format
df2 <- df[df$Date %in% c("1/2/2007","2/2/2007") ,] 
 
## covert the columns to proper classes for the plots - 1 datetime, and 6 numerics
datetime <- strptime(paste(df2$Date, df2$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  
globalActivePower <- as.numeric(df2$Global_active_power) 
subMetering1 <- as.numeric(df2$Sub_metering_1) 
subMetering2 <- as.numeric(df2$Sub_metering_2) 
subMetering3 <- as.numeric(df2$Sub_metering_3) 
globalReactivePower <- as.numeric(df2$Global_reactive_power) 
voltage <- as.numeric(df2$Voltage) 

##open the graphics device
png("plot2.png", width=480, height=480) 

## this plot is from 2nd part of project 
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

##close the graphics device
dev.off() 
