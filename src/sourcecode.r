install.packages("PBSmapping")
install.packages("maptools")
install.packages("ggmap")
install.packages("stringr")
install.packages("lubridate")

library(tidyverse)
library(psych)
library(PBSmapping)
library(maptools)
library(ggmap)
library(stringr)
library(lubridate)


#We will be using ver.2
MassShoot <- file.choose()
MassShooting <- read.csv(MassShoot)

#data pre-handing
MassShooting<- rename(MassShooting,ID=`S#`,Total=`Total victims`,Mental=`Mental Health Issues`)

MassShooting$Gender[MassShooting$Gender=="M"] <- "Male"
MassShooting$Gender[MassShooting$Gender=="M/F"] <- "Male/Female"

MassShooting$Mental[MassShooting$Mental=="Unclear" | MassShooting$Mental=="unknown"] <- "NA"

MassShooting$Race[MassShooting$Race=="black" | MassShooting$Race=="Black American or African American" | MassShooting$Race=="Black American or African American/Unknown"] <- "Black"
MassShooting$Race[MassShooting$Race=="white" | MassShooting$Race=="White American or European American" | MassShooting$Race=="White American or European American/Some other Race"] <- "White"
MassShooting$Race[MassShootingt$Race=="unclear" | MassShooting$Race==""] <- "NA"
MassShooting$Race[MassShooting$Race=="Asian American/Some other race" | MassShooting$Race=="Asian American"] <- "Asian"
MassShooting$Race[MassShooting$Race=="Latino" | MassShooting$Race=="Native American" | MassShooting$Race=="Native American or Alaska Native" | MassShooting$Race=="Some other race" | MassShooting$Race=="Two or more races"] <- "Other"

#Import US map.
usShape <- importShapefile(file.choose(),readDBF=TRUE)
# File to load: gz_2010_us_040_00_500k.shp
pointPlot <- function(Y, X, EID)
{
  pointData <- data.frame(EID,X,Y)
  eventData <- as.EventData(pointData,projection=NA)
  addPoints(eventData,col="red",cex=.5)
}
plotPolys(usShape)
plotPolys(usShape, xlim=c(-130,-60),ylim=c(20,50))

pointPlot(41.49111,-120.54909, 1)