### CS 390 Final Project

**Final Report**

**Ziyang Zhang, Xingbang Liu, Zijun Xia**

**15 December, 2017**

#### Introduction:

Our chosen data documents every mass shooting case from 1966 to 2017 and keeps been updated once there is new case happened. The raw data was found on kaggle.com. The data set provides basic information as the columns’ names can tell: title, place(including city and state), and a summary that describes what happened in the case. And there are also other significant indicators that can be used and analyzed by tools in R and we will deeply examine that later in our report. The biggest issue with this data is that it is not tidy enough to directly run through codes. First of all, we notice that in gender column, there are different symbols representing the same thing like “M” and “Male”, so we standardized them to be “Male”. Also there are “unknown” values for criminals’ gender and we think that should not happen because there must be information about it, so we searched online and replaced the “unknown”s with the actual gender information we found. For the race column, we meet the same problems. There are missing values so we searched and filled them. Besides, we correct misnamed values. The last change is to transform the “Date” variable to a form that R language can understand.

#### Implementation:

**Question 1:**



**Question 2:**

Based on question 1, we made two maps of each state. For the first map, we made the map of victims of each states from 1966 to 2017. We can find that there are many states that have the same or similar colors, which means they may totally have the same or similar victims for 1966 to 2017.  

![comparison](/pic/color.png "comparison")

Like the picture shows, we chose Florida and Texas. Based on the graph, they both get the light blue colors, so they basically both get the high victims totally from 1966 to 2017. So, on the question 2, we decided to check whether those two states have the same victims.

Firstly, we filtered the data, we used the filter method to only choose the state Florida and Texas, and we transferred this data set to the excel format and used the sum in excel to add the victims of each year together. Then, we transferred this data set back to the csv format again, and we got the table like:

![table](/pic/filter.png "table")

Then, based on this table, we used the code to do the t-test in order to find the p-value.

![t.test](/pic/ttest.jpg "t.test")

We can see the p-value is equal to 0.9777. Since this p-value is bigger than alpha value: 0.05, we can say this p-value does not reject the Null hypothesis, which means this p-value does not reject that those two states have the same victims. Since this value is also almost equal to 1, so we can say this p-value also prove that those states almost have the same victims.

So, we prove that if the states have the same or similar colors, which means they have the same or similar victims.

**Question 3:**

In this question, I would try to find patterns with shooters' age and their mental state, or the mix of them, which means the question could be, though out the age distribution, shooters are tend to have mental disorder or not.

As the picture shows:

![table](/pic/summary.png "table")

The age information are in the summary column, and that means it requires regular expression to extract ages. 
