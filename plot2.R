## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland ( fips == "24510" ) 
## from 1999 to 2008? Use the base plotting system to make a plot answering this question.

## Loading required packages

library(dplyr)

## Loading the data into R. Select the directory in which you have unzipped the file.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


## Extracting Baltimore City data from NEI dataset.

PM_2.5_Baltimore = NEI %>% group_by(year) %>% subset(fips == 24510)

## Creating a data frame which contains sum of Emissions of all the years which i will plot for the comparison.

sum_PM_2.5_Baltimore = with(PM_2.5_Baltimore,tapply(Emissions,year,sum))
sum_PM_2.5_Baltimore = data.frame(year = rownames(sum_PM_2.5_Baltimore),Total_PM_2.5_Emission = sum_PM_2.5_Baltimore,row.names = NULL)

## Creating plot2.png file

png("plot2.png")

## Creating PM_2.5 plot of Baltimore City PM_2.5 data

plot(sum_PM_2.5_Baltimore,xaxt = "n",xlab = "Years",ylab = "PM_2.5 Emission Total in Tons",main = "PM_2.5 Emission Total in Tons in Baltimore City, Maryland", type = "l",lwd = 2)

axis(side = 1, at = sum_PM_2.5_Baltimore$year,labels = sum_PM_2.5_Baltimore$year)

## Note: From the above chart we can see that there is a decreasing in PM_2.5 over the years in Baltimore city. Although it increased in 2005 from 2002 but then it decreased in 2008

## Closing the device

dev.off()




