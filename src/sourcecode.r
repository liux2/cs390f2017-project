install.packages("PBSmapping")
install.packages("maptools")
library(tidyverse)
library(psych)
library(PBSmapping)
library(maptools)

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
<<<<<<< HEAD
=======
pointPlot(41.49111,-120.54909, 1)

>>>>>>> 87cae64838a372aa0c6d3d2f73d3e9d3eaf8147a
#We will be using ver.2
MassShoot <- file.choose()
MassShooting <- read.csv(MassShoot)

#data pre-handing
dat <- MessShooting %>% 
