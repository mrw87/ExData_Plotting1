## Get the Household Power Data 
HouseholdPwrData <- read.csv("/Users/meganwilliams/Desktop/Data Science JH Coursera/Exploratory Data Analysis/Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                             nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
HouseholdPwrData$Date <- as.Date(HouseholdPwrData$Date, format="%d/%m/%Y")

## Subsetting the relevant data
Data <- subset(HouseholdPwrData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(HouseholdPwrData)

## Converting the dates
DateTime <- paste(as.Date(Data$Date), Data$Time)
Data$DateTime <- as.POSIXct(DateTime)

##Construct Plot 2 and save as PNG file
plot(Data$Global_active_power~Data$DateTime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
