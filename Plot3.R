## Get the Household Power Data

HouseholdPwrData <- read.csv("/Users/meganwilliams/Desktop/Data Science JH Coursera/Exploratory Data Analysis/Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                             nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
HouseholdPwrData$Date <- as.Date(HouseholdPwrData$Date, format="%d/%m/%Y")

## Subset the relevant data
Data <- subset(HouseholdPwrData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(HouseholdPwrData)

## Convert the dates
DateTime <- paste(as.Date(Data$Date), Data$Time)
Data$DateTime <- as.POSIXct(DateTime)

## Construct Plot 3
with(Data, {
  plot(Sub_metering_1~DateTime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Save as PNG file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
