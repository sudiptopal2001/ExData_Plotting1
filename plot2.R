ElectricPower<-read.table('household_power_consumption.txt',header = TRUE,sep=';',stringsAsFactors = FALSE)

ElectricPower$Date<-strptime(ElectricPower$Date,format="%d/%m/%Y")
ElectricPower$Date<-as.Date(ElectricPower$Date,'%Y-%m-%d')

ElectricPowerFeb<-subset(ElectricPower,Date>='2007-2-1' & Date<='2007-2-2')


with(ElectricPowerFeb,plot(Global_active_power,type = 'l',xlab='',ylab = 'Global Active Power (kilowatts)',xaxt = 'n'))
axis(1, at=c(0,1500,2500), labels=c('Thu','Fri','Sat'))

dev.copy(png,file='plot2.png')
dev.off()
