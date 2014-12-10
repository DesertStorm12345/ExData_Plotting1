library(datasets)

## Load the data and rename column name. Only 2007-02-01 and 2007-02-02 entries are loaded to optimize loading time. 
data <- read.table("./household_power_consumption.txt", header = TRUE, skip = 66637, nrows = 2880, sep = ";", na.strings="?")
names(data) = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

## Converting time
data <- transform(data, Time = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))

## Plot the graph and save as PNG
png("plot4.png")

par(mfrow=c(2,2))

##Plot 1
plot(data$Time, data$Global_active_power, type="l", xlab="", ylab="Global Active Power")

##Plot 2
plot(data$Time, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

##Plot 3
plot(data$Time, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data$Time,data$Sub_metering_2,col="red")
lines(data$Time,data$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n")

##Plot 4
plot(data$Time, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()