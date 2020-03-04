##  Assignment 1 - Exploratory Data Analysis
##  plot4

## plot4 - Read the text file separated by ";"
data <-read.csv2("C:/Users/csms1109007/Documents/JABG/Econometria/Data Science - Johns Hopkings/4 Exploratory Data Analysis/Week1/exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";", dec = ",")

## convert the flat dataset to a data frame
data <- tbl_df(data)

## subset the required dates
data2 <- subset(data, data$Date=="1/2/2007"|data$Date=="2/2/2007")

## change the class of the column "Global_active_power"
data3 <- as.numeric(as.character(data2$Global_active_power))

## create the png file
png("plot4.png", width = 480, height = 480)

## Change the format for columns Date & Time
datatime <- strptime(paste(data2$Date, data2$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## assign the plots view (2 rows * 2 columns)
par(mfrow=c(2,2))

## Create the plot(1,1)
plot(datatime, data3, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## Create the plot(1,2)
p2<-as.numeric(as.character(data2$Voltage))
plot(datatime, p2, type="l", xlab="datetime", ylab="Voltage")

## Create the plot(2,1)
plot(datatime, data2$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering",col="black",ylim=c(0,40))
par(new=TRUE)
plot(datatime, data2$Sub_metering_2, type="l", xlab="", ylab="",col="red",ylim=c(0,40))
par(new=TRUE)
plot(datatime, data2$Sub_metering_3, type="l", xlab="", ylab="",col="blue",ylim=c(0,40))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))

## Create the plot(2,2)
p4<-as.numeric(as.character(data2$Global_reactive_power))
plot(datatime, p4, type="l", xlab="datetime", ylab="Global_reactive_power")

## Close the process
dev.off()