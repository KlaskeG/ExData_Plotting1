library(dplyr)
#reading the data from home directory
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";", na.strings = "?")
data$DateTime<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data_sel<-data[data$Date %in% as.Date("2007-02-01"):as.Date("2007-02-02"), ]

#plot2
Sys.setlocale("LC_TIME", "English") 
png<-png("plot2.png") ; par(mar=c(4, 4, 4, 2) + 0.1)
plot(data_sel$DateTime,data_sel$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()