### CS 390 Final Project

**Final Report**

**Ziyang Zhang, Xingbang Liu, Zijun Xia**

**15 December, 2017**

#### Introduction:



#### Implementation:

**Question: 1**

**Question: 2**

Based on question 1, we made two maps of each state. For the first map, we made the map of victims of each states from 1966 to 2017. We can find that there are many states that have the same or similar colors, which means they may totally have the same or similar victims for 1966 to 2017.  

![comparison](/pic/color.png "comparison")

Like the picture shows, we chose Florida and Texas. Based on the graph, they both get the light blue colors, so they basically both get the high victims totally from 1966 to 2017. So, on the question 2, we decided to check whether those two states have the same victims.

Firstly, we filtered the data, we used the filter method to only choose the state Florida and Texas, and we transferred this data set to the excel format and used the sum in excel to add the victims of each year together. Then, we transferred this data set back to the csv format again, and we got the table like:

![table](/pic/filter.png "table")

Then, based on this table, we used the code to do the t-test in order to find the p-value.

![t.test](/pic/ttest.png "t.test")

We can see the p-value is equal to 0.9777. Since this p-value is bigger than alpha value: 0.05, we can say this p-value does not reject the Null hypothesis, which means this p-value does not reject that those two states have the same victims. Since this value is also almost equal to 1, so we can say this p-value also     prove that those states almost have the same victims.

So, we prove that if the states have the same or similar colors, which means they have the same or similar victims.

**Question: 3**
