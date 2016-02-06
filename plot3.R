library(dplyr)
#reading the data from home directory
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";", na.strings = "?")
data$DateTime<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data_sel<-data[data$Date %in% as.Date("2007-02-01"):as.Date("2007-02-02"), ]

#plot3
png<-png("plot3.png") ; par(mar=c(4, 4, 4, 2) + 0.1)
plot(data_sel$DateTime,data_sel$Sub_metering_1,type="n",xlab="",ylab="Energy Sub metering")
lines(data_sel$DateTime,data_sel$Sub_metering_1,col="black")
lines(data_sel$DateTime,data_sel$Sub_metering_2,col="red")
lines(data_sel$DateTime,data_sel$Sub_metering_3,col="blue")
legend("topright",lwd=c(1,1,1),lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()