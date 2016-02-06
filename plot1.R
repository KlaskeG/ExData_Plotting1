library(dplyr)
#reading the data from home directory
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";", na.strings = "?")
data$DateTime<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data_sel<-data[data$Date %in% as.Date("2007-02-01"):as.Date("2007-02-02"), ]

#plot1
png<-png("plot1.png") ; par(mar=c(4, 4, 4, 2) + 0.1)
hist(data_sel$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.off()