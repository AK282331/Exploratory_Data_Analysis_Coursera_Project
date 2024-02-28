## Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

## Loading required packages

library(dplyr)

## Loading the data into R. Select the directory in which you have unzipped the file.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Sub-setting the data (Extract coal - combustion related sources data from 1999 - 2008)

## Extracting SCC related to Coal related sources

Coal_SCC = SCC[grep("Coal",SCC$EI.Sector),]

## Filtering the NEI data as per Coal_SCC to keep NEI data related to coal related sources

Coal_NEI = NEI[NEI$SCC %in% Coal_SCC$SCC,]

## Grouping Coal_NEI data as per year and then aggregating the Emissions of each year

Coal_NEI = group_by(Coal_NEI,year)

Total_Coal_Emissions = summarise(Coal_NEI,sum(Emissions))

## Creating PNG file to save it locally

png(plot4.png)

## Plotting the graph of NEI data related to Coal Combustion from 1999 - 2008

plot(Total_Coal_Emissions,type = "l",xaxt = "n", xlab = "Year", ylab = "Total Emissions (in Tons)",main = "Total Emissions (in Tons) from Coal Combustion related sources in United States from 1999 to 2008")
axis(side = 1,at = Total_Coal_Emissions$year,labels = Total_Coal_Emissions$year)

## Note: From the above graph we can conclude that there is a decrease over the years in Emissions related to Coal Combustion in United states.

## Closing the Device

dev.off()



