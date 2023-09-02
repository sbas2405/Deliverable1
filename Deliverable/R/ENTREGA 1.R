library(nycflights13)
library(tidyverse)

#EXERCISE 5.2.4 ITEMS 1 AND 2
flights <- nycflights13::flights
DELAYS <- filter(DATA,arr_delay >="2")
HOUSTON <- filter(DATA,dest=="HOU")

#EXERCISE 5.3.1
MISSING <- flights %>% arrange(desc(is.na(dep_time)))
MORE_DELAYED <- flights %>% arrange(desc(arr_delay)) 
EARLY <- flights %>% arrange((dep_delay)) 
FASTER <- flights %>% arrange(air_time)
AWAY <- flights %>% arrange(desc(distance))
NEARBY <- flights %>% arrange(distance)

#EXERCISE 5.4.1 ITEMS 2,3 Y 4
#ITEM 2. What happens if you include the name of a variable multiple times in a select() call?
#Ans:Multiple copies of that variable will be included in the resulting data frame. 
#In other words, the variable will be duplicated in the output.

#ITEM 3. What does the (any_of()) function do? Why might it be helpful in conjunction with this vector?
#vars <- c("year", "month", "day", "dep_delay", "arr_delay")
#Ans: In cases where you have a variable that contains the column names you 
#want to select, using `any_ofany_of()can make your code more adaptable and 
#maintainable, since you can easily modify the `any_ofany_of()-type variable 
#to make your code more adaptable and maintainable.

#ITEM 4. Does the result of running the following code surprise you? How do the select
#helpers deal with case by default? How can you change that default?
#select(flights, contains("TIME"))
#This code selects the columns whose names contain the string "TIME"
#and which contain the text "TIME" in their cells.

#EXERCISE 5.5.2 ITEMS 1 Y 2
MODIFIED <- flights %>%
  mutate(dep_time_mins = (dep_time %/% 100) * 60 + dep_time %% 100,
         sched_dep_time_mins = (sched_dep_time %/% 100) * 60 + sched_dep_time %% 100)

COMPARISON <- MODIFIED %>%
  mutate(arr_dep_time_diff = arr_time - dep_time_mins) %>%
  filter(!is.na(air_time) & !is.na(arr_dep_time_diff)) %>%
  select(air_time, arr_dep_time_diff)

#EXERCISE 5.6.7 ITEM 1
#Certainly, here are seven different ways to assess the typical delay characteristics of the mentioned flight scenarios:
#Average Delay: Calculate the average delay across all flights. For each scenario, this would provide an overview of the typical delay experienced by the flights.
#Median Delay: Calculate the median delay for each scenario. This would give a middle point in the distribution of delays and is less influenced by outliers
#Longest Delay: Identify the longest delay experienced in each scenario. This can highlight the extreme cases that might have significant impacts.
#Impact of Extreme Delays: Calculate the weighted average of delays, considering the impact of extreme delays. For instance, the weighted average might consider not just the duration of the delay but also the frequency of occurrence.
#Frequency of On-Time Flights: Calculate the percentage of flights that are on time (not delayed). This can help understand how often delays occur in each scenario.