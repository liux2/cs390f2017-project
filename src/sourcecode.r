install.packages("PBSmapping")
install.packages("maptools")
library(tidyverse)
library(psych)
library(PBSmapping)
library(maptools)

#Import US map.
usShape <- importShapefile( file.choose(),readDBF=TRUE)
# File to load: gz_2010_us_040_00_500k.shp

#We will be using ver.2
MassShoot <- file.choose()
MassShooting <- read.csv(MassShoot)

#data pre-handing
dat <- MessShooting %>% 
