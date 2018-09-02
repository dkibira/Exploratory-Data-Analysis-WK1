setwd("......\data")
myData <- read.table("household_power_consumption.txt", sep=";", header=T)
newdata <- subset(myData, Date == "1/2/2007" | Date =="2/2/2007")
newdata$Date <- as.Date(newdata$Date, format="%d/%m/%Y")
newdata$Global_active_power <- as.character(newdata$Global_active_power)
newdata$Global_active_power <- as.numeric(newdata$Global_active_power)

#plot 1
hist(newdata$Global_active_power,main="Global Active Power",xlab="Global Active Power(killowatts)", col="red")
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
