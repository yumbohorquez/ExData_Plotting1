##  Assignment 1 - Exploratory Data Analysis
##  plot2

## plot2 - Read the text file separated by ";"
data <-read.csv2("C:/Users/csms1109007/Documents/JABG/Econometria/Data Science - Johns Hopkings/4 Exploratory Data Analysis/Week1/exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";", dec = ",")

## convert the flat dataset to a data frame
data <- tbl_df(data)

## subset the required dates
data2 <- subset(data, data$Date=="1/2/2007"|data$Date=="2/2/2007")

## change the class of the column "Global_active_power"
data3 <- as.numeric(as.character(data2$Global_active_power))

## create the png file
png("plot2.png", width = 480, height = 480)

## Change the format for columns Date & Time
datatime <- strptime(paste(data2$Date, data2$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## Create the plot type=lines (l)
plot(datatime, data3, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## close the process
dev.off()