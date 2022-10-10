data=read.delim2(file="C:/Users/EFBCV/Downloads/household_power_consumption.txt", header=TRUE, sep=";")
final_data=subset(data, (data$Date=="1/2/2007" | data$Date=="2/2/2007"))
final_data$Date <- as.Date(final_data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(final_data$Date), final_data$Time)
final_data$Datetime <- as.POSIXct(datetime)

with(final_data, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()