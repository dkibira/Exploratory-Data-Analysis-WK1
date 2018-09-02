setwd("c:\\kibira\\R-Course")
myData <- read.table("household_power_consumption.txt", sep=";", header=T)
newdata <- subset(myData, Date == "1/2/2007" | Date =="2/2/2007")
newdata$Date <- as.Date(newdata$Date, format="%d/%m/%Y")

newdata$Global_active_power <- as.character(newdata$Global_active_power)
newdata$Global_active_power <- as.numeric(newdata$Global_active_power)

#plot 2
dts1 <- paste(newdata$Date, newdata$Time)
dts2 <- as.POSIXct(dts1, format = "%Y-%m-%d %H:%M:%S")
plot(dts2, newdata$Global_active_power, type="l", xlab="", ylab= "Global Active Power(killowatts)")
dev.copy(png, file="plot2.png", width=480, height=480) 
dev.off()
