* Describe everything you have done so far
So far, we have replaced some names and spited some columns.
* necessary research, examined in detail the data set you have selected,
* decided on the approach you will use to analyze it
In order to
* Describe anything new that you have learned so far
* any unexpected challenges that you have encountered
The original dataset was not rigorous, and it would be very time consuming if we find codes, for example, regular expression, to edit the cells. Therefore, we decided to edit some data by hands. We split location column to state and city, and we also use the tittle, summary or the latitude and longitude to find the specific location if the original data were unknown. Also, we filled empty latitude and longitude by searching the city location.
'''{r}
x<-seq( 0,2*pi,0.2 )
y<-sin( x )
plot( x,y )
'''
