households <- "household_power_consumption.txt" ## this is a placeholder for the file

twodays <- read.table(households, header = TRUE, sep = ";", na.strings = "?", colClasses = c("character", "character", rep("numeric", 7)), nrows = 2880, skip = 66637, stringsAsFactors = F) 

power <- twodays[, 3]

date <- twodays[, 1]
time <- twodays[, 2]
newaxis <- strptime(paste(date, time, sep=" "), format = "%d/%m/%Y %H:%M:%S")

Sub_metering_1 <- twodays[, 7]
Sub_metering_2 <- twodays[, 8]
Sub_metering_3 <- twodays[, 9]
Sub_metering <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

plot(newaxis, power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "") 


plot(newaxis, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(newaxis, Sub_metering_2, col = "red")
lines(newaxis, Sub_metering_3, col = "blue")
legend("topright", Sub_metering, col = c(1, 2, 4), lty = "solid")

reactive <- twodays[, 4]
plot(newaxis, reactive, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

voltage <- twodays[, 5]
plot(newaxis, voltage, type = "l", ylab = "Voltage", xlab = "datetime")

png("rplot4.png", width = 480, height = 480, bg = "white")
par(mfrow = c(2, 2)) 
with(twodays, {
 		plot(newaxis, power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
 		plot(newaxis, voltage, type = "l", ylab = "Voltage", xlab = "datetime")
 		plot(newaxis, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
 		lines(newaxis, Sub_metering_2, col = "red")
 		lines(newaxis, Sub_metering_3, col = "blue")
 		legend("topright", Sub_metering, col = c(1, 2, 4), lty = "solid", bty = "n")
 		plot(newaxis, reactive, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
	})
dev.off()
