plot2 <- function() {
  datat<-read.table("household_power_consumption.txt",header=TRUE,sep=';')
  datat$Date <- as.Date(datat$Date, format = "%d/%m/%Y")
  requireddata <- datat[datat$Date %in% as.Date(c('2007-02-01','2007-02-02')),]
  requireddata$Global_active_power<-as.numeric(as.character(requireddata$Global_active_power))
  png(file="plot2.png")
  plot(strptime(paste(requireddata$Date,requireddata$Time), "%Y-%m-%d %H:%M:%S"),requireddata$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
  dev.off()
}