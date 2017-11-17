* Describe everything you have done so far

First of all, we have cleaned the dataset. The original data is too raw and not regulated on many cell's information, so we cannot directly use them. Thus, we opened this data on LiBreOffice Calc and edit this file manually. To be specific, we rename the columns in a easier way to be called. Then, we divide the location column to specific states and cities columns which can be used for plotting. Also we added the recently happened Las Vegas mass shooting data. We noticed that there are some missing values in the latitude and longitude columns which, however, should exist since if we know the city name, we know the location. So we searched online GPS information to find out the exact latitude and longitude of the places we want to know. As for other missing values, we filled NA in them, so the implicit NAs became explicit.
Since our further study of the data will require us to compare variables with time, so we extract the exact year information out of the date column.
Then we start handling our data and doing some visualizations.      
* necessary research, examined in detail the data set you have selected

* decided on the approach you will use to analyze it

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
Then, we choose the file of the data set that we selected. Since the data set we used has some problems, like the name of each columns were not clear,and there were the different name for the same variable, so we used some code to make the data set be more clear, and the code all in our r file.

* Describe anything new that you have learned so far

* any unexpected challenges that you have encountered

The original dataset was not rigorous, and it would be very time consuming if we find codes, for example, regular expression, to edit the cells. Therefore, we decided to edit some data by hands. We split location column to state and city, and we also use the tittle, summary or the latitude and longitude to find the specific location if the original data were unknown. Also, we filled empty latitude and longitude by searching the city location.

![alt text](/pic/.jpg "Logo Title Text 1")
