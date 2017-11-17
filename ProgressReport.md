#### Ziyang Zhang, Xingbang Liu, Zijun Xia
#### CS 390 Final Project
#### Progress Report
#### 17 November, 2017

First of all, we have cleaned the dataset. The original data is too raw and not regulated on many cell's information, so we cannot directly use them. Thus, we opened this data on LiBreOffice Calc and edit this file manually. To be specific, we rename the columns in a easier way to be called. Then, we divide the location column to specific states and cities columns which can be used for plotting. Also we added the recently happened Las Vegas mass shooting data. We noticed that there are some missing values in the latitude and longitude columns which, however, should exist since if we know the city name, we know the location. So we searched online GPS information to find out the exact latitude and longitude of the places we want to know. As for other missing values, we filled NA in them, so the implicit NAs became explicit.
Since our further study of the data will require us to compare variables with time, so we extract the exact year information out of the date column.
Then we start handling our data and doing some visualizations.      

We found this [US mess shooting data](https://www.kaggle.com/sorzhe/us-mass-shooting/data) on kaggle, and there are a lot of brilliant analysis and visualizations done by others’ work. However, we found most visualizations are programmed by Python. So we want to know how this playable data can be applied to our R language. When we go deep into this dataset, we noticed that there are some missing values in the latitude and longitude columns which, however, should exist since if we know the city name, we know the location. So we searched [online address to latlong website](https://www.latlong.net/convert-address-to-lat-long.html ) to find out the exact latitude and longitude of the places we want to know.

In order to do all the analysis in our project, we need to installed some of the packages and added some libraries :

```{r}
install.packages("maps")
install.packages("stringr")
install.packages("lubridate")

library(tidyverse)
library(psych)
library(lubridate)
library(maps)
library(stringr)
```

Then, we choose the file of the data set that we selected. we have cleaned the dataset. The original data is too raw and not regulated on many cell's information, so we cannot directly use them. Thus, we opened this data on LiBreOffice Calc and edit this file manually. To be specific, we rename the columns in a easier way to be called. Then, we divide the location column to specific states and cities columns which can be used for plotting. Also we added the recently happened Las Vegas mass shooting data. We noticed that there are some missing values in the latitude and longitude columns which, however, should exist since if we know the city name, we know the location. So we searched online GPS information to find out the exact latitude and longitude of the places we want to know. As for other missing values, we filled NA in them, so the implicit NAs became explicit, and the code all in our r file.
In order to make the map for each state to see the victim rate, we used the state map from the package we installed, and we also used the data that include each state's name and the number of the victims. Since the state names of the state map in the package are all low cases, we used the

```{r}
MassShooting$state <- tolower(MassShooting$state)  
```

to make those name be all low cases. Then, we used the code of ggplot, merge, and arrange to create our mass shooting map. For example:

```{r}
Victim <- file.choose()
Victims <- read.csv(Victim)
Shooting_map <- merge(states_map, Victims, by.x="region", by.y = "State")
Shooting_map <- arrange(Shooting_map,group,order)
ggplot(data = Shooting_map, aes(x=long, y=lat, group = group, fill = Victims)) + geom_polygon(colour = "black") +  labs(title = "USA Map")
```

Then, we get the map:
![map](/pic/map.png "map")

In this project, we have learned something by ourselves. First of all, we learned the basic implementation of regular expression. Also, we learned how to implement map by using map package. Finally we learned how to manipulate date by using lubridate package.

The original dataset was not rigorous, and it would be very time consuming if we find codes, for example, regular expression, to edit the cells. Therefore, we decided to edit some data by hands. We split location column to state and city, and we also use the tittle, summary or the latitude and longitude to find the specific location if the original data were unknown. Also, we filled empty latitude and longitude by searching the city location.

This is the processes we have so far. We didn't have a complete study questions so far, the questions we have so far are not very considerable. We will complete them during our next stage study. 
