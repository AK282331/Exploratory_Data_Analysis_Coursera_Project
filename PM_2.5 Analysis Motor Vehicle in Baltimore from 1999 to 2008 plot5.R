## How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

## Loading required packages

library(dplyr)

## Loading the data into R. Select the directory in which you have unzipped the file.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Extracting SCC related to Motor Vehicle Sources

Motor_SCC = SCC[grep("Vehicle",SCC$SCC.Level.Two),]

## Extracting Baltimore City data from NEI Data and Filtering that as per Motor_SCC.

Baltimore_Motor = NEI %>% filter(fips == "24510" & SCC %in% Motor_SCC$SCC) %>% group_by(year) %>% summarise(sum(Emissions))
Baltimore_Motor$`sum(Emissions)` = round(Baltimore_Motor$`sum(Emissions)`,0)

## Creating png file

png("plot5.png")

## Plotting emissions from motor vehicle sources changed from 1999–2008 in Baltimore City

plot(Baltimore_Motor,type="l",xaxt="n",xlab = "Year",ylab = "Total Emissions (in Tons)",main = "Total Emissions (in Tons) from motor vehicle sources changed\nfrom 1999–2008 in Baltimore City")
axis(side =1 ,at = Baltimore_Motor$year,labels = Baltimore_Motor$year)
text(x = Baltimore_Motor$year,y = Baltimore_Motor$`sum(Emissions)` + 6, labels = Baltimore_Motor$`sum(Emissions)`,cex = 1.5,font = 4)


## Note: From the above plot we can conclude that over the years the emissions from motor vehicles in Baltimore city has reduced

## Closing the device

dev.off()