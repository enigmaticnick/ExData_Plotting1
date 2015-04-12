
library(data.table)
data1 = fread("household_power_consumption.txt",skip = "1/2/2007",nrows = 2880,sep = ";",colClasses = "character")
data1 = as.data.frame(data1)
ndf = read.table("household_power_consumption.txt",nrows = 1,sep = ";",header= TRUE)
names(data1) = names(ndf)
rm(ndf)

data1[,2] = as.POSIXct(paste(data1[,1],data1[,2],sep=" "),format = "%d/%m/%Y %H:%M:%S")
for(i in 3:9)
data1[,i] = as.numeric(as.character(data1[,i]))

par(mfrow = c(2,2))

plot(data1[,2],data1[,3],type = "l",col = "black",xlab = "",ylab = "Global Active Power (kilowatts)")
plot(data1[,2],data1[,5],type = "l",col = "black",xlab = "datetime",ylab = "Voltage")
plot(data1[,2],data1[,7],type = 'l',col = "black",xlab = "",ylab = "Energy sub metering")
lines(data1[,2],data1[,8],type = 'l', col = "red")
lines(data1[,2],data1[,9],type = 'l', col = "blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"),lty = 1)

plot(data1[,2],data1[,4],type = "l",col = "black",xlab = "datetime",ylab = "Global_reactive_Power")
