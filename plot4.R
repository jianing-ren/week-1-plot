electricity=read.csv("household_power_consumption.txt",sep=";")
electricity <- subset(electricity, Date %in% c("1/2/2007","2/2/2007"))
electricity$Date2=as.POSIXct(paste(as.Date(electricity$Date,"%d/%m/%Y"),electricity$Time))

quartz()

par(mfrow=c(2,2))
electricity[c(3:5,7:9)]=lapply(electricity[c(3:5,7:9)],function(x) as.numeric(as.character(x)))

    plot(electricity$Date2,electricity[[3]],type = "l",xlab="",ylab="Global Active Power (kilowatts)")
    plot(electricity$Date2,electricity[[4]],type = "l",xlab="",ylab="Voltage (volt)")
    ##copied from plot3.R to reconstruct plot3
        plot(electricity$Date2,electricity$Sub_metering_1,type="l",xlab="",ylab='Energy sub metering')
        lines(electricity$Date2,electricity$Sub_metering_2, col="red")
        lines(electricity$Date2,electricity$Sub_metering_3,col="blue")
        legend("topright",legend=names(electricity[7:9]),col=c("black","red","blue"),lty=1,bty="n")
    ##
    plot(electricity$Date2,electricity[[5]],type="l",xlab="",ylab="Global reactive power (kilowatts)")
  
dev.copy(png,file="plot4.png")
dev.off()
