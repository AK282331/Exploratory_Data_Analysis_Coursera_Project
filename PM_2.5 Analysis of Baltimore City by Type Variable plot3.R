## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
## which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
## Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.


## Loading required packages

library(dplyr)
library(ggplot2)

## Loading the data into R. Select the directory in which you have unzipped the file.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


## Extracting Baltimore City data from NEI dataset.

PM_2.5_Baltimore = NEI %>% group_by(type,year) %>% subset(fips == 24510)

## Creating Plot3.png file

png("plot3.png")

## Creating plot of Emissions by Type Variable

gg = ggplot(PM_2.5_Baltimore,aes(x = year, y= Emissions,col = year))
gg + geom_line(lwd = 5) + facet_wrap(as.factor(PM_2.5_Baltimore$type),nrow = 1) + labs(title = expression("Total Tons of PM"[2.5]*" Emissions in Baltimore by Source Type")) + xlab("Years") + ylab("Total Emissions in Tons")

## Closing the device

dev.off()

