
##############################
#'  Forelesning 1 
##############################
#' `Objective`: learn/review basic commands from `dplyr`
#' 
#' R makes use of the # or #' signs to add comments, 
#' so that you and others can understand what the R code 
#' is about.

##########################################################
##########################################################
######
#' `dplyr- Basic data manipulation`
#' browseURL("https://r4ds.had.co.nz/transform.html")
#' `filter()` - Pick observations (rows) by their values   
#' `select()` -  Pick variables (columns) by their names  
#' `mutate()` - Create new variables (columns) with functions of existing variables  
#' `arrange()`-  Reorder rows using  
#' `summarise()` - Collapse many values down to a single summary 
#' `rename()`  - Rename columns (variables):
#' `group_by()` - Group rows by columns (variables)
#' 
##########################################################
#############################################################
########


rm (list = ls())
library(tidyverse)
# Use the gapminder data-set from the gapminder package
library(gapminder) 
data("gapminder")


# Some Questions:

# exploring data
str(gapminder)

glimpse(gapminder)



#' Q0. From the gapminder dataset, select country, year & pop

q0 <- gapminder %>% 
  select("country", "year", "pop")




#' Q1: From the gapminder dataset, filter out the data from Norway before and including 1977.
q1 <- gapminder %>% 
  filter(year >= 1977) %>% 
  filter(country == "Norway")






#' Q2: Filter the data from Norway or Sweden before and including 1970.

#q2 <- gapminder %>% 
  #filter(country %in% c("Norway", "Sweden"), year <= 1970)


Norway_Sweden <- c("Norway", "Sweden")

q2 <- gapminder %>% 
  filter(country %in% Norway_Sweden, year <=1970)






#' Q3. Filter the data from Norway, Sweden, or Denmark before and including 1970.

Scandinavia <- c("Norway", "Sweden", "Denmark") 

q3 <- gapminder %>% 
  filter(country %in% Scandinavia, year <= 1970)





#' Q4. Following Q3. Let us say you do not like long variable names such as "gdpPercap".  
#' Rename "gdpPercap" by gdp_pc        


q4 <- q3 %>% 
  rename(gdp_pc = gdpPercap)





#' Q5. Following Q4. Arrange rows according to ascending order of "gdp_pc"
q5 <- q4 %>% 
  arrange(gdp_pc)







#' Q6. Following Q5. Arrange rows according to descending order of "gdp_pc"
q6 <- q5 %>% 
  arrange(desc(gdp_pc))






#' Q7. Arrange rows according to ascending order of "gdp_pc", within each year. 

q7 <- q6 %>% 
  arrange(year, gdp_pc)




#'Q8.Data from Norway.   
#' Create a new variable that is GDP  from gdpPercap & pop
q8 <- gapminder %>% 
  filter(country =="Norway") %>% 
  mutate(GDP = gdpPercap*pop)





#' Q9. Data from Norway. 
#' Create a new variable called "gdpNOK" that is GDP per per billion NOK (1 000 000 000 NOK) 
#' (1 USD=9 NOK)

q9 <- q8 %>% 
  mutate(gdpNOK = GDP/1e9) %>% 
  mutate(gdpNOK = gdpNOK*9)




#' Q10.Use mutate and ifelse to Categorise "gdpNOK" into 3 categories,
#'  (i.e., less than or equal to 999, between 1000 and 1999, and greater than 2000).

q10 <- gapminder %>% 
  mutate(GDP = gdpPercap*pop) %>% 
  mutate(gdpNOK = GDP/1e9) %>% 
  mutate(gdpNOK = gdpNOK*9) %>% 
  mutate(gdpcat =         ifelse(gdpNOK <= 999, "less than a billion",
                          ifelse(gdpNOK > 1000 & gdpNOK <= 1999, "between a billion and two billions" , 
                          ifelse(gdpNOK >2000, "larger than two billions",  NA))))



                  #       gdpcat = ifelse(gdpNOK <= 999, "less than a billion",
                   #     ifelse(gdpNOK > 1000 & gdpNOK <= 1999, "between a billion and two billions",
                    #    ifelse(gdpNOK > 2000, "larger than two billions", NA))))




#' Q11. Calculate the average lifExp of all three Nordic countries
#' (i.e., Norway, Sweden, Denmark)


q11 <- gapminder %>% 
  filter(country %in% Scandinavia) %>% 
  mutate(avg_life = mean(lifeExp))

#q11 <- gapminder %>% 
  #filter(country %in% Scandinavia) %>% 
  #summarise(mean(lifeExp))






#' Q12. Calculate the average lifExp of the three countries,per country. 

#q12 <- gapminder %>% 
#  filter(country %in% Scandinavia) %>% 
#  group_by(country) %>% 
#  mutate(avg_life = mean(lifeExp))


q12 <- gapminder %>% 
  filter(country %in% Scandinavia) %>% 
  group_by(country) %>% 
  summarise(avg_life = mean(lifeExp))




#' Q13. Calculate mean life expectancy per country 
#' (i.e., for every country in the gapminder data set)

q13 <- gapminder %>% 
  group_by(country) %>% 
  summarise (avg_life = mean(lifeExp))






#' Q14. Calculate mean life expectancy per continent.
q14 <- gapminder %>% 
  group_by(continent) %>% 
  summarise (avg_life = mean(lifeExp))







#' Q15. calculate mean life expectancy by continent & country

q15 <- gapminder %>% 
  group_by(continent, country) %>% 
  summarise (avg_life = mean(lifeExp))






#' Q16. Calculate mean life expectancy by continent & add min and max lifeExp
q16 <- gapminder %>% 
  group_by(continent) %>% 
  summarise(avg_life=mean(lifeExp), min=min(lifeExp), max=max(lifeExp))







# Q17. Scatter plot of gdpPercap vs lifeExp 

gapminder %>% 
  ggplot(aes(x=gdpPercap, y=lifeExp)) +
  geom_point(alpha = 0.4) +
  ggtitle("gdppercap vs life expectancy")






# Q18. Scatter plot of gdpPercap vs lifeExp by Continent

gapminder %>% 
  ggplot(aes(x=gdpPercap, y=lifeExp, color=continent, shape=continent))+
  geom_point()







# Q19. Scatter plot of gdpPercap vs lifeExp by Continent. Use different shapes per continent

gapminder %>% 
  ggplot(aes(x= gdpPercap, y= lifeExp))+
  geom_point(alpha=0.4)+
  facet_wrap(~continent, ncol=3)+
  ggtitle("GdpPercap vs lifeExp by continent")
  

