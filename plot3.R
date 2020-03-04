##  Assignment 1 - Exploratory Data Analysis
##  plot3

## plot3 - Read the text file separated by ";"
data <-read.csv2("C:/Users/csms1109007/Documents/JABG/Econometria/Data Science - Johns Hopkings/4 Exploratory Data Analysis/Week1/exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";", dec = ",")

## convert the flat dataset to a data frame
data <- tbl_df(data)

## subset the required dates
data2 <- subset(data, data$Date=="1/2/2007"|data$Date=="2/2/2007")

## create the png file
png("plot3.png", width = 480, height = 480)

## Change the format for columns Date & Time
datatime <- strptime(paste(data2$Date, data2$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## adding to the plot the sub_metering_1 variable
plot(datatime, data2$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering",col="black",ylim=c(0,40))
par(new=TRUE)

## adding to the plot the sub_metering_2 variable
plot(datatime, data2$Sub_metering_2, type="l", xlab="", ylab="",col="red",ylim=c(0,40))
par(new=TRUE)

## adding to the plot the sub_metering_3 variable
plot(datatime, data2$Sub_metering_3, type="l", xlab="", ylab="",col="blue",ylim=c(0,40))

## adding the legend on the topright
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))

## close the process
dev.off()