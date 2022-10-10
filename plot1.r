library(datasets)
data=read.delim2(file="C:/Users/EFBCV/Downloads/household_power_consumption.txt", header=TRUE, sep=";")
final_data=subset(data, (data$Date=="1/2/2007" | data$Date=="2/2/2007"))
final_data$Global_active_power=as.numeric(final_data$Global_active_power)
hist(final_data$Global_active_power, col="red", xlab= "Global Active Power (kilowatts)", ylab = "Frequency", main="Global Active Power")
dev.copy(png, file="plot1.png")
dev.off()


