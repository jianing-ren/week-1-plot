electricity=read.csv("household_power_consumption.txt",sep=";")
electricity <- subset(electricity, Date %in% c("1/2/2007","2/2/2007"))
electricity$Date2=as.POSIXct(paste(as.Date(electricity$Date,"%d/%m/%Y"),electricity$Time))

quartz()
plot(as.numeric(Global_active_power)~Date2,data=electricity,type="l",ylab="Global Active Power (Kilowatts)")
dev.copy(png,file="plot2.png")
dev.off()

