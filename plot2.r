library(datasets)
data=read.delim2(file="C:/Users/EFBCV/Downloads/household_power_consumption.txt", header=TRUE, sep=";")
final_data=subset(data, (data$Date=="1/2/2007" | data$Date=="2/2/2007"))
final_data$Date <- as.Date(final_data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(final_data$Date), final_data$Time)
final_data$Datetime <- as.POSIXct(datetime)

with(final_data, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
