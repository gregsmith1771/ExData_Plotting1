households <- "household_power_consumption.txt" 

part_dec <- 37 + 60 * 6 
december <- 16 * 24 * 60
january <- 31 * 24 * 60
skip_row_number <- december + january + part_dec
lines_parcel <- 24 * 60 * 2

twodays <- read.table(households, header = TRUE, sep = ";", na.strings = "?", colClasses = c("character", "character", rep("numeric", 7)), nrows = 2880, skip = 66637, stringsAsFactors = F) 

power <- twodays[, 3] 

date <- twodays[, 1]
time <- twodays[, 2]
newaxis <- strptime(paste(date, time, sep=" "), format = "%d/%m/%Y %H:%M:%S")

png("rplot2.png", width = 480, height = 480, bg = "white")
plot(newaxis, power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
