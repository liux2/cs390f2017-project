install.packages("PBSmapping")
install.packages("maptools")
install.packages("lubridate")
install.packages("PBSmapping")
install.packages("maptools")
install.packages("data.table")

library(tidyverse)
library(lubridate)
library(data.table)
library(psych)
library(PBSmapping)
library(maptools)

#Import US map.
usShape <- importShapefile( file.choose(),readDBF=TRUE)
# File to load: gz_2010_us_040_00_500k.shp

#We will be using ver.2
MassShoot <- file.choose()
MassShooting <- read.csv(MassShoot)

#data pre-handling
dat <- MessShooting %>% 
