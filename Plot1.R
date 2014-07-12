## Get the Household Power dataset
HouseholdPwrData <- read.csv("/Users/meganwilliams/Desktop/Data Science JH Coursera/Exploratory Data Analysis/Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
HouseholdPwrData$Date <- as.Date(HouseholdPwrData$Date, format="%d/%m/%Y")

## Subset the relevant data
Data <- subset(HouseholdPwrData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(HouseholdPwrData)

## Convert the dates
DateTime <- paste(as.Date(Data$Date), Data$Time)
Data$DateTime <- as.POSIXct(DateTime)

## Construct Plot 1
hist(Data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Save Plot 1 as a PNG file 
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
