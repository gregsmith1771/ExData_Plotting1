households <- "household_power_consumption.txt" 

part_dec <- 37 + 60 * 6 
december <- 16 * 24 * 60
january <- 31 * 24 * 60
skip_row_number <- december + january + part_dec
lines_parcel <- 24 * 60 * 2

twodays <- read.table(households, header = TRUE, sep = ";", na.strings = "?", colClasses = c("character", "character", rep("numeric", 7)), nrows = 2880, skip = 66637, stringsAsFactors = F) 

power <- twodays[, 3] 

png("rplot1.png", width = 480, height = 480, bg = "white")
hist(power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()