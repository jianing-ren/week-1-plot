electricity=read.csv("household_power_consumption.txt",sep=";")
electricity <- subset(electricity, Date %in% c("1/2/2007","2/2/2007"))
electricity$Date2=as.POSIXct(paste(as.Date(electricity$Date,"%d/%m/%Y"),electricity$Time))

quartz()
electricity[7:9]=lapply(electricity[7:9],function(x) as.numeric(as.character(x)))
plot(electricity$Date2,electricity$Sub_metering_1,type="l",xlab="",ylab='Energy sub metering')
lines(electricity$Date2,electricity$Sub_metering_2, col="red")
lines(electricity$Date2,electricity$Sub_metering_3,col="blue")
legend("topright",legend=names(electricity[7:9]),col=c("black","red","blue"),lty=1)

dev.copy(png,file="plot3.png")
dev.off()
