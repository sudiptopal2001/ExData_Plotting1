ElectricPower<-read.table('household_power_consumption.txt',header = TRUE,sep=';',stringsAsFactors = FALSE)

ElectricPower$Date<-strptime(ElectricPower$Date,format="%d/%m/%Y")
ElectricPower$Date<-as.Date(ElectricPower$Date,'%Y-%m-%d')

ElectricPowerFeb<-subset(ElectricPower,Date>='2007-2-1' & Date<='2007-2-2')

par(mfrow=c(2,2))

#Plot 1

with(ElectricPowerFeb,plot(Global_active_power,type = 'l',xlab='',ylab = 'Global Active Power',xaxt = 'n'))
axis(1, at=c(0,1500,2500), labels=c('Thu','Fri','Sat'))

#Plot 2

with(ElectricPowerFeb,plot(Voltage,type = 'l',xlab='datetime',ylab = 'Voltage',xaxt='n'))
axis(1, at=c(0,1500,2500), labels=c('Thu','Fri','Sat'))


#Plot 3

with(ElectricPowerFeb,plot(Sub_metering_1,type = 'l',col='black',xlab='',ylab = 'Energy sub metering',xaxt='n'))
with(ElectricPowerFeb,lines(Sub_metering_2,col='red'))
with(ElectricPowerFeb,lines(Sub_metering_3,col='blue'))

axis(1, at=c(0,1500,2500), labels=c('Thu','Fri','Sat'))

legend(1200,47,bty='n',cex=0.8,y.intersp = 0.2,lty=c(1,1),col=c('black','red','blue'),legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))


#Plot 4

with(ElectricPowerFeb,plot(Global_reactive_power,type = 'l',xlab='datetime',ylab = 'Global_reactive_power',xaxt='n'))
axis(1, at=c(0,1500,2500), labels=c('Thu','Fri','Sat'))

dev.copy(png,file='plot4.png')
dev.off()
