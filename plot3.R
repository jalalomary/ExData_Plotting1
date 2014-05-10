plot3 <- function() {
  datat<-read.table("household_power_consumption.txt",header=TRUE,sep=';')
  datat$Date <- as.Date(datat$Date, format = "%d/%m/%Y")
  requireddata <- datat[datat$Date %in% as.Date(c('2007-02-01','2007-02-02')),]
  requireddata$Sub_metering_1 <- as.numeric(as.character(requireddata$Sub_metering_1))
  requireddata$Sub_metering_2 <- as.numeric(as.character(requireddata$Sub_metering_2))
  requireddata$Sub_metering_3 <- as.numeric(as.character(requireddata$Sub_metering_3))
  png(file="plot3.png")
  plot(strptime(paste(requireddata$Date,requireddata$Time), "%Y-%m-%d %H:%M:%S"),requireddata$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  lines(strptime(paste(requireddata$Date,requireddata$Time), "%Y-%m-%d %H:%M:%S"),requireddata$Sub_metering_1,type="l",col="Black")
  lines(strptime(paste(requireddata$Date,requireddata$Time), "%Y-%m-%d %H:%M:%S"),requireddata$Sub_metering_2,type="l",col="Red")
  lines(strptime(paste(requireddata$Date,requireddata$Time), "%Y-%m-%d %H:%M:%S"),requireddata$Sub_metering_3,type="l",col="Blue")
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("Black","Red","Blue"),lty=1)
  dev.off()
}