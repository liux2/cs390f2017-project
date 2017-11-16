library(tidyverse)
library(psych)

#We will be using ver.2
MassShoot <- file.choose()
MassShooting <- read.csv(MassShoot)

#data pre-handing
dat <- MessShooting %>% 