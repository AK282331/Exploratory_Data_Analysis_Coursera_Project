## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

## Loading the data into R. Select the directory in which you have unzipped the file.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


## Creating a data frame and include the sum of Emissions over the years
## which i will plot and show the comparison over the years


PM_2.5_sum = tapply(NEI$Emissions,NEI$year,FUN = sum)
PM_2.5_sum = data.frame(year = rownames(PM_2.5_sum),PM_2.5_Emissions = PM_2.5_sum,row.names = NULL)


## Create PNG File

png("plot1.png")

## Plot the chart

plot(PM_2.5_sum,type = "l",xaxt = "n",xlab = "Years",ylab = "PM_2.5 Emissions Total in Tons",main = "PM_2.5 Total Emissions in Tons in United States",lwd = 2)
axis(side = 1, at = PM_2.5_sum$year,labels = PM_2.5_sum$year)

## Note: From the above chart we can say that Yes over the years the Emissions of 
## PM_2.5 has decreased


## Close the device

dev.off()
