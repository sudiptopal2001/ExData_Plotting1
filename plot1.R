ElectricPower<-read.table('household_power_consumption.txt',header = TRUE,sep=';',stringsAsFactors = FALSE)

ElectricPower$Date<-strptime(ElectricPower$Date,format="%d/%m/%Y")
ElectricPower$Date<-as.Date(ElectricPower$Date,'%Y-%m-%d')

ElectricPowerFeb<-subset(ElectricPower,Date>='2007-2-1' & Date<='2007-2-2')

ElectricPowerFeb$Global_active_power<-as.numeric(ElectricPowerFeb$Global_active_power)

hist(ElectricPowerFeb$Global_active_power,col='red',xlab = 'Global Active Power (kilowatts)',main='Global Active Power')

dev.copy(png,file='plot1.png')
dev.off() 
