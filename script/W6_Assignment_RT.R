# Week 6 Homework

library(tidyverse)
gapminder <- read_csv("https://gge-ucd.github.io/R-DAVIS/data/gapminder.csv")
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) + 
  geom_point()


# change the code to reflect life expectancy change through years
ggplot(gapminder, aes(x = year, y = lifeExp)) + 
  geom_point()

# changed the ex axis from gdpperCap to year (I did orginally run this code as 
#ggplot(gapminder, aes(x = year, y = lifeExp)) + 
#geom_point(alpha = 0.1, aes(color=continent))))  ---- that made some cool colors appear on the chart. Also it highlighted how Europe is leading in life exepectancy 




# Look at the following code. What do you think the scale_x_log10() line is doing? What do you think the geom_smooth() line is doing?

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(color = continent), size = .25) + 
  scale_x_log10() +
  geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') +
  theme_bw()
# oooo this is another cool way to do it and they included the color which was part of my original script.
#  geom smooth creates a line representing a trend between life expectancy and gdp Percap
# log(10) helps "smooth" out the data and transforms the x axis from years to log(years). Might help distinguish extreme values ? Like data might become too smooshed when looking at life expectancy between Euroepe and Africa and ASia. They are all at the extreme ends of the graph.



######## CHALLENGE##################
# Modify the above code to size the points in proportion to the population of the country. Hint: Are you translating data to a visual feature of the plot?

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp, size=pop)) +
  geom_point(aes(color = continent)) + 
  scale_x_log10() +
  geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') +
  theme_bw()
# I had issues getting R to recognize pop. It kept wanting to call it populations even though the gapminder dataframe labels populations as pop. Size was moved up to the first line to make it as a global change. In this case size becomes a global esthetic rather than a geom.