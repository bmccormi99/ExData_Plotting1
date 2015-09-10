## set my local working directory
setwd("C:/Users/Bill/Dropbox/R/ExData_Plotting1")

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
png("plot4.png", width=480, height=480) 

##setup the plot area - 2 rows X 2 columns
par(mfrow = c(2, 2))  
 
## first plot is from 2nd part of project (upper left)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## this plot is new by voltage for the 4th part of project (upper right)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage") 

## this plot is from the 3rd part of the project (lower left)
## adds 2 lines and a legend
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="") 
lines(datetime, subMetering2, type="l", col="red") 
lines(datetime, subMetering3, type="l", col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2, col=c("black", "red", "blue"), bty="o") 

##this plot is new by GlocalReactivePower for the 4th part of the project (lower right)
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power") 
 
##close the graphics device
dev.off() 
