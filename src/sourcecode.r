install.packages("PBSmapping")
install.packages("maptools")
install.packages("ggmap")
install.packages("stringr")
install.packages("lubridate")

library(tidyverse)
library(psych)
library(ggmap)
library(lubridate)
library(maps)
library(stringr)

#We will be using ver.2
MassShoot <- file.choose()
MassShooting <- read.csv(MassShoot)

#data pre-handing(part learned from Shuhao, Linkedin: https://www.linkedin.com/in/%E4%B9%A6%E8%B1%AA-%E9%82%AC-57891910b/)
MassShooting <- rename(MassShooting,state= `State`,ID=`S.`,Total=`Total.victims`,Mental=`Mental.Health.Issues`)

#add vegas data
MassShooting$Injured[MassShooting$ID==1] <- 527
MassShooting$Fatalities[MassShooting$ID==1] <- 59
MassShooting$Total[MassShooting$ID==1] <- 586
MassShooting$Race[MassShooting$ID==1] <- "White"
MassShooting$Gender[MassShooting$ID==1] <- "Male"
MassShooting$Summary[MassShooting$ID==1] <- "Stephen Paddock, a 64-year-old gunman opened fire on a large crowd of concertgoers at the Route 91 Harvest music festival on the Las Vegas Strip, killing 59 people and injuring 527"

#keep handling
MassShooting$Gender[MassShooting$Gender=="M"] <- "Male"
MassShooting$Gender[MassShooting$Gender=="M/F"] <- "Male/Female"
MassShooting$Mental[MassShooting$Mental=="Unclear" | MassShooting$Mental=="unknown" | MassShooting$Mental=="Unknown"] <- "Unknown"
MassShooting$Race[MassShooting$Race=="black" | MassShooting$Race=="Black American or African American" | MassShooting$Race=="Black American or African American/Unknown"] <- "Black"
MassShooting$Race[MassShooting$Race=="white" | MassShooting$Race=="White American or European American" | MassShooting$Race=="White American or European American/Some other Race"] <- "White"
MassShooting$Race[MassShooting$Race=="unclear" | MassShooting$Race==""] <- "Unknown"
MassShooting$Race[MassShooting$Race=="Asian American/Some other race" | MassShooting$Race=="Asian American"] <- "Asian"
MassShooting$Race[MassShooting$Race=="Latino" | MassShooting$Race=="Native American" | MassShooting$Race=="Native American or Alaska Native" | MassShooting$Race=="Some other race" | MassShooting$Race=="Two or more races"] <- "Other"

#date
MassShooting$Date <- as.Date(MassShooting$Date,"%m/%d/%Y")
MassShooting$year <- year(MassShooting$Date)

#mapping
states_map <- map_data("state")
ggplot(states_map, aes(x=long,y=lat,group=group)) + geom_polygon(fill="white",colour="black") + labs(title = "USA Map")
MassShooting$state <- tolower(MassShooting$state)
Victim <- file.choose()
Victims <- read.csv(Victim)
Shooting_map <- merge(states_map, Victims, by.x="region", by.y = "State")
Shooting_map <- arrange(Shooting_map,group,order)
ggplot(data = Shooting_map, aes(x=long, y=lat, group = group, fill = Victims)) + geom_polygon(colour = "black") +  labs(title = "USA Map")






