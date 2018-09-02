setwd("c:\\kibira\\R-Course")
myData <- read.table("household_power_consumption.txt", sep=";", header=T)
newdata <- subset(myData, Date == "1/2/2007" | Date =="2/2/2007")
newdata$Date <- as.Date(newdata$Date, format="%d/%m/%Y")

newdata$Global_active_power <- as.character(newdata$Global_active_power)
newdata$Global_active_power <- as.numeric(newdata$Global_active_power)
dts1 <- paste(newdata$Date, newdata$Time)
dts2 <- as.POSIXct(dts1, format = "%Y-%m-%d %H:%M:%S")

#plot 3
plot(dts2, newdata$Sub_metering_1,type="l",xlab="", ylab= "Energy sub metering", col="black")
lines(dts2, newdata$Sub_metering_2,col="red")
lines(dts2, newdata$Sub_metering_3,col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black", "red", "blue"), lty=1:2, cex=0.8)
dev.copy(png, file ="plot3.png", width = 480, height = 480)
dev.off()
