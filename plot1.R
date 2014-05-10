plot1 <- function() {
  datat<-read.table("household_power_consumption.txt",header=TRUE,sep=';')
  datat$Date <- as.Date(datat$Date, format = "%d/%m/%Y")
  requireddata <- datat[datat$Date %in% as.Date(c('2007-02-01','2007-02-02')),]
  requireddata$Global_active_power<-as.numeric(as.character(requireddata$Global_active_power))
  png(file="plot1.png")
  hist(requireddata$Global_active_power, col="Red",xlab="Global Active Power (kilowatts)", main="Global Active Power")
  dev.off()
}