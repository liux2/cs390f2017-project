install.packages("maps")
install.packages("stringr")
install.packages("lubridate")

library(plyr)
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
Shooting_map <- merge(states_map, MassShooting, by.x="region", by.y = "state")

Victim <- file.choose()
Victims <- read.csv(Victim)
Shooting_map <- merge(states_map, Victims, by.x="region", by.y = "State")
Shooting_map <- arrange(Shooting_map,group,order)
ggplot(data = Shooting_map, aes(x=long, y=lat, group = group, fill = Victims)) + geom_polygon(colour = "black") +  labs(title = "USA Map")

# plot a quantile map
Death <- file.choose()
Deathrate <- read.csv(Death)
Deathrate <- transform(Deathrate, rate = Fatalities / Victims)
qa <- quantile(Deathrate$rate,c(0,0.2,0.4,0.6,0.8,1.0))
Deathrate$rate_q <- cut(Deathrate$rate, qa, labels = c("0-20%","20-40%","40-60%","60-80%","80-100%"),include.lowest = TRUE)
states <- ddply(states_map, .(region), summarise, lat = mean(lat, na.rm = TRUE), long = mean(long, na.rm = TRUE))
Deathrate<- merge(Deathrate, states, by.x = "State", by.y = "region")
ratemap <- ggplot(Deathrate, aes(map_id = State, fill = rate_q)) + geom_map(map = states_map, colour = "black") + scale_fill_brewer(palette = "Set2") + expand_limits(x = states_map$long, y = states_map$lat)+ coord_map("polyconic") + labs(fill = "Death Rate\nPercentile", title = "MassShooting in USA")

#xiazijun de
#Shooting_state <- filter(MassShooting, state %in% c(" texas", " florida"))
#Shooting_state <- select(Shooting_state, state, Total, year)
Shooting_states <- file.choose()
Shooting_state <- read.csv(Shooting_states)
t.test(data = Shooting_state, victim ~ state)

#age from summary
temp <- mutate(MassShooting,age=str_extract_all(MassShooting$Summary,pattern="(,\\s)\\d{2}(,)"),age2=str_extract_all(MassShooting$Summary,pattern="(a\\s)\\d{2}(-year)"))
temp$age <- str_sub(temp$age,3,4)
temp$age2 <- str_sub(temp$age2,3,4)
tem <- subset(temp,temp$age!="ar")
tem2 <- subset(temp,temp$age2!="ar")
tem <- rbind(tem,tem2)
for(i in 1:nrow(tem))
  if(tem$age[i]=="ar") tem$age[i] <- tem$age2[i]
tem <- arrange(tem,age)
tem <- tem[-c(1:4),]
tem <- arrange(tem,ID)
tem$age <- as.integer(tem$age)
tem3 <- tem %>% select(ID,age) %>% mutate(agecut=cut(tem$age,breaks = 10*(1:7)))
shoot_age <- left_join(tem3, MassShooting,by="ID")

#plot of age 

ggplot(shoot_age, mapping = aes(agecut))+geom_bar(fill="lightblue")+ggtitle("age distribution")
ggplot(shoot_age, mapping=aes(agecut,fill=Mental))+geom_bar(position="fill")+ggtitle("age with mental factor")

#plot of mental statement
mental <- subset(MassShooting, Mental != "Unknown")
#mental_Cas <- data.frame(table(mental$Mental,mental$Level))
#colnames(mental_Cas) <- c("Mental","Level","Freq")
#ggplot(mental_Cas, mapping = aes(x= factor(Level, levels=c("Under 5","5 to 10","above 10")),y= Freq,fill = Mental))+geom_bar(stat="identity",position="dodge")+xlab("Level")
barplot(tapply(mental$Total,mental$Mental,sum),main="Shooter with mental disease",col = "lightblue",ylab = "Number of casualties")