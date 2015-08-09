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

png("rplot3.png", width = 480, height = 480, bg = "white")
plot(newaxis, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(newaxis, Sub_metering_2, col = "red")
lines(newaxis, Sub_metering_3, col = "blue")
legend("topright", Sub_metering, col = c(1, 2, 4), lty = "solid")
dev.off()