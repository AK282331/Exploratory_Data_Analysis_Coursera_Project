## Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, 
## California fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

## Loading required packages

library(dplyr)

## Loading the data into R. Select the directory in which you have unzipped the file.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Extracting SCC related to Motor Vehicle Sources

Motor_SCC = SCC[grep("Vehicle",SCC$SCC.Level.Two),]

## Extracting Baltimore and LosAngeles County data from NEI as per Motor_SCC.

Balti_Los = NEI %>% filter(fips == "24510" | fips == "06037") %>% subset(SCC %in% Motor_SCC$SCC) %>% mutate(County = if_else(fips == "06037","Los Angeles County",if_else(fips=="24510","Baltimore County","NA")))%>% group_by(year,County) %>% summarise(sum(Emissions)) %>% rename(Emissions = "sum(Emissions)") %>% as.data.frame()
Balti_Los$Emissions = round(Balti_Los$Emissions, 0)

## Creating png file

png("plot6.png")

## Plot total Emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County.

gg = ggplot(Balti_Los,aes(factor(year),Emissions,col = County))
gg + geom_bar(stat = "identity",aes(fill = County)) + facet_grid(.~County) + geom_text(label = Balti_Los$Emissions,vjust = -1) + xlab("Year") + ylab("Total Emissions (in Tons)") + ggtitle("Total Emissions (in tons) in Baltimore and Los Angeles County")


## Closing the devide

dev.off()

