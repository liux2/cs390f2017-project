### CS 390 Final Project

**Final Report**

**Ziyang Zhang, Xingbang Liu, Zijun Xia**

**15 December, 2017**

#### Introduction:

Our chosen data documents every mass shooting case from 1966 to 2017 and keeps been updated once there is new case happened. The raw data was found on kaggle.com. The data set provides basic information as the columns’ names can tell: title, place(including city and state), and a summary that describes what happened in the case. And there are also other significant indicators that can be used and analyzed by tools in R and we will deeply examine that later in our report. The biggest issue with this data is that it is not tidy enough to directly run through codes. First of all, we notice that in gender column, there are different symbols representing the same thing like “M” and “Male”, so we standardized them to be “Male”. Also there are “unknown” values for criminals’ gender and we think that should not happen because there must be information about it, so we searched online and replaced the “unknown”s with the actual gender information we found. For the race column, we meet the same problems. There are missing values so we searched and filled them. Besides, we correct misnamed values. The last change is to transform the “Date” variable to a form that R language can understand.

#### Implementation:

**Question 1:**

Our first question is finding the best way to visualize the data. When we were exploring the features of this data set, we found there are latitude and longitude values and then we immediately associated them with the map plotting we learned in class. However, after we applied it, the result was not that satisfying because we only saw hundreds of scattered points randomly distributed all over the map, so we could not produce any analysis from this method. Instead, we chose to fill the map with color into blank states as the graph below.

![map](/pic/map.png "map")

As we can see when the color variates from dark to bright, the number goes up, which means the total number of victims from mass shooting is rising. What catches our eyes is that California, Texas, and Florida has the brightest color and therefore should have the biggest number of victims in history. However, when the colors of adjoined states are all dark, it is hard to decide which has the lower number. Also from the map above, we can observe that the dark states are in the north while the bright ones are in the south. Thus, a hypothesis can be brought up that the latitude can influence the likelihood of mass shooting. Unfortunately, we lack sufficient data to support it, so we just have to say we cannot prove this hypothesis.

Another way to fill color in a blank state is not determined by its victims number but the ratio of death in mass shooting. First of all, we built a quantile bar divided by five groups from using the code from library ”plyr”. Then we merge our data with this quantile bar where each state’s ratio fit into a twenty percent range of quantile. Finally we get a map like this.

![map](/pic/rate.png "map")

Based on the information given above, if two states have different color then they must have different rates of death in mass shooting. Although two states have the same color, they still likely have different rates. However, the rates must be close to each other. Thus, we roughly view them as equal, at least on map.
In addition, the other way of plotting we frequently apply here is bar because it is easy to compare numbers between different states. To save some space, I will not attach them here but they will be shown by running the code or seen in the “pic” folder.

**Question 2:**

Based on question 1, we made two maps of each state. For the first map, we made the map of victims of each states from 1966 to 2017. We can find that there are many states that have the same or similar colors, which means they may totally have the same or similar victims for 1966 to 2017.  

![comparison](/pic/color.jpg "comparison")

Like the picture shows, we chose Florida and Texas. Based on the graph, they both get the light blue colors, so they basically both get the high victims totally from 1966 to 2017. So, on the question 2, we decided to check whether those two states have the same victims.

Firstly, we filtered the data, we used the filter method to only choose the state Florida and Texas, and we transferred this data set to the excel format and used the sum in excel to add the victims of each year together. Then, we transferred this data set back to the csv format again, and we got the table like:

![table](/pic/filter.png "table")

Then, based on this table, we used the code to do the t-test in order to find the p-value.

![t.test](/pic/ttest.jpg "t.test")

We can see the p-value is equal to 0.9777. Since this p-value is bigger than alpha value: 0.05, we can say this p-value does not reject the Null hypothesis, which means this p-value does not reject that those two states have the same victims. Since this value is also almost equal to 1, so we can say this p-value also prove that those states almost have the same victims.

So, we prove that if the states have the same or similar colors, which means they have the same or similar victims.

**Question 3:**

In this question, I would try to find patterns with shooters' age and their mental state, or the mix of them, which means the question could be, through out the age distribution, shooters are tend to have mental disorder or not.

As the capture shows:

![table](/pic/summary.png "table")

The age information are in the summary column, and that means it requires regular expression to extract ages. After the handling, another table has been generated, and it contains the age of shooter and the age cut it belongs to.

![table](/pic/new.png "table")

The next step is to visualize the data. According to our question, the first two plots are about the age factor and mental state factor. To generate the mental state plot, table called mental was firstly generated. We deleted people with unknown mental state.

![age cut](/pic/agecut.png "age cut")

![mental state](/pic/mental.png "mental state")

According to the plots, we can find that, people under 50 years old are more likely to commit mass shooting, especially from 30 years old to 40 years old. People with mental disorder are more likely to become a shooter, the rate is twice as high as people do not have mental disorder.

Finally, we created another table with the distribution of mental statement.

![mental state with age](/pic/ageMental.png "mental state with age")

We can find that, through out ages under 60, it is always people with mental issues are more likely to commit mass shooting. Therefor government maybe have to take actions on give more cares to people with mental disorder. 
