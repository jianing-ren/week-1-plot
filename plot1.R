#plot 1
electricity=read.csv("household_power_consumption.txt",sep=";")
par(mar=c(8,8,6,6))
quartz()
hist(as.numeric(electricity$Global_active_power),col="red",
     main="Global Active Power",
     xlab="global active power (kilowatts)")
dev.copy(png,file="plot1.png")
dev.off()
