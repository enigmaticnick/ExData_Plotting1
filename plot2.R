library(data.table)
data1 = fread("household_power_consumption.txt",skip = "1/2/2007",nrows = 2880,sep = ";",colClasses = "character")
data1 = as.data.frame(data1)
ndf = read.table("household_power_consumption.txt",nrows = 1,sep = ";",header= TRUE)
names(data1) = names(ndf)
rm(ndf)

data1[,2] = as.POSIXct(paste(data1[,1],data1[,2],sep=" "),format = "%d/%m/%Y %H:%M:%S")
for(i in 3:9)
data1[,i] = as.numeric(as.character(data1[,i]))

plot(data1[,2],data1[,3],type = "l",col = "black",xlab = "",ylab = "Global Active Power (kilowatts)")

