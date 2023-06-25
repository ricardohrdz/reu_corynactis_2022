#install.packages(c("tidyverse", "hexbin", "patchwork", "RSQLite", "here"))
library(tidyverse)
library(hexbin)
library(patchwork)
library(RSQLite)
library(here)
library(janitor)
library(lubridate)

t1_tank <- read_csv(here("data","0715_T1.csv")) %>%
  clean_names()

# function cleans out the environment tab
rm(list = ls())


str(t1_temp_graph)

t1_temp_graph%>% 
  select(date) %>% 
  as.Date(as.character(date))

date <- t1_temp_graph[["date"]]
t1_temp_graph$date <- ymd_hm(t1_temp_graph$date)

t1_tank_f <- t1_tank %>% 
  mutate(temp_f= temp_c*9/5 + 32) %>% 
  select(date,temp_c,temp_f) %>% 
  mutate(temp_ch= as.character(temp_f)) %>% 
  mutate(date_t= mdy_hm(date))

str(t1_tank_f)

view(t1_tank_f)
str(t1_tank_f)

ggplot(t1_tank_f, aes(x= date_t, y=temp_c))+
  geom_point()


#t1_tank(is.na(t1_tank))
#na.omit(t1_tank)
#print(t1_tank)

#ncol(t1_tank)
#t1_tank$temp <- factor(t1_tank$temp)
#summarize(t1_tank$temp)
#paste(t1_tank$year, t1_tank$month, t1_tank$day, sep = "-")

# do i make the date and temp into vectors?

#t1_tank$temp
#1_tank$date

#t1_tank$temp <- factor(t1_tank$teymp)
#t1_tank$date <- factor(t1_tank$date)
#summary(t1_tank$temp)
#summary(t1_tank$date)
#summary(t1_tank)


#temp_fct <- factor(t1_tank$temp)
#as.numeric(levels(temp_fct))[temp_fct] 

#date_fct <- factor(t1_tank$date)
#as.numeric(levels(date_fct))[date_fct] 




class(t1_temp_graph)

select(t1_tank, date, temp_c)


t1_temp_graph <- t1_tank %>%
  select(date, temp_c) %>% 
  filter(!is.na(temp_c))

view(t1_temp_graph)

ggplot(t1_temp_graph, aes(x= date, y=temp_c))+
  geom_point()

is.na(t1_temp_graph)

str(t1_temp_graph)


install.packages("lubridate")
library(lubridate)



t1_temp_graph_ex_count <- t1_temp_graph_ex %>% 
  count(date,temp_c)
       