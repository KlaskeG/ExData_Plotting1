library(dplyr)
#reading the data from home directory
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";", na.strings = "?")
data$DateTime<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data_sel<-data[data$Date %in% as.Date("2007-02-01"):as.Date("2007-02-02"), ]

#plot4
png<-png("plot4.png") 
par(mfrow = c(2, 2), mar=c(5, 4, 3, 1) + 0.1,  oma = c(1, 0, 1, 0))
plot(data_sel$DateTime,data_sel$Global_active_power,type="l",xlab="",ylab="Global Active Power",cex.lab=0.9,cex.axis=0.9)
plot(data_sel$DateTime,data_sel$Voltage,type="l",xlab="datetime",ylab="Voltage",cex.lab=0.9,cex.axis=0.9)
plot(data_sel$DateTime,data_sel$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering",cex.lab=0.9,cex.axis=0.9)
lines(data_sel$DateTime,data_sel$Sub_metering_1,col="black")
lines(data_sel$DateTime,data_sel$Sub_metering_2,col="red")
lines(data_sel$DateTime,data_sel$Sub_metering_3,col="blue")
legend("topright",lwd=c(1,1,1),lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n", cex=0.9)
plot(data_sel$DateTime,data_sel$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power",cex.lab=0.9,cex.axis=0.9)
dev.off()