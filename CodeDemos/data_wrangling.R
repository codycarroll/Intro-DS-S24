my_df1 = data.frame(
  City = c("Austin", "Atlanta", "Vancouver"), 
  Fancy = c(35000, 43000, 106000), 
  Normal = c(30000, 44000, 77000)
)

my_df1

#difficulty w wide format:
ggplot(my_df1, aes(x = City, y = Fancy, fill = Fancy)) + 
  geom_bar(stat = "identity")


library(ggplot2)
library(tidyr)
library(dplyr)
library(scales)
library(nlme)



?pivot_longer


my_tidy_df1 = pivot_longer(my_df1, 
                           cols = c(Fancy, Normal),
                           names_to = "lightSign", 
                           values_to = "Sales")
my_tidy_df1


ggplot(my_tidy_df1, 
       aes(x = City, 
           y = Sales, 
           group = lightSign, 
           fill = lightSign)) + 
  geom_bar(stat = "identity", 
           position = "dodge") +
  scale_y_continuous(labels = comma) + 
  ylab("Sales") + 
  xlab("\n City") + 
  theme(legend.title = element_blank()) 

#stat = "identity" means plot just the values of Sales without anything changed
#position = "dodge" means put bars side-by-side instead of stacked
#theme(legend.title = element_blank()) removes legend title

#Exercise:
#Experiment with removing arguments like position, legend.title, stat.
#What changes for each?


set.seed(1979)

(my_df2 = data.frame(
  uniqueId = 1:4,
  treatment = sample(rep(c('iOS', 'Android'), each = 2)),
  work_am = runif(4, 0, 1),
  home_am = runif(4, 0, 1),
  work_pm = runif(4, 1, 2),
  home_pm = runif(4, 1, 2)
))

my_tidy_df1 = pivot_longer(my_df1, 
                           cols = c(Fancy, Normal),
                           names_to = "lightSign", 
                           values_to = "Sales")
my_tidy_df1

my_tidy_df2 = pivot_longer(my_df2, 
                           cols = c(work_am, home_am, work_pm, home_pm),
                           names_to = "location_time_of_day", 
                           values_to = "time_spent")


my_tidy_df2 = pivot_longer(my_df2, 
                           cols = c(work_am, home_am, work_pm, home_pm), 
                           names_to = "sample",
                           values_to = "time")

# my_tidy_df2 = gather(my_df2, sample, time, -uniqueId, -treatment)
# my_tidy_df2 %>% arrange(uniqueId)

head(my_tidy_df2)

my_sep_tidy_df2 = separate(my_tidy_df2, 
                           sample, 
                           into = c("location", "time_of_day"), 
                           sep = "\\_")

head(my_sep_tidy_df2)


my_sep_tidy_df2$time_of_day = toupper(my_sep_tidy_df2$time_of_day)

head(my_sep_tidy_df2, 3)

#intense code but pretty simple plot
ggplot(my_sep_tidy_df2, aes(x = time_of_day, y = time)) + 
  aes(group = interaction(location, treatment), 
      colour = interaction(location, treatment)) +
  stat_summary(fun.y = max, geom = "line", size = 1) +
  stat_summary(fun.y = identity, geom = "point", size = 3) +
  labs(x = "\n Time of Day", y = "Time on Mobile Device \n") +
  theme(legend.title = element_blank(),
        axis.title = element_text(size = 20,face = "italic"),
        axis.text = element_text(size = 20, face = "italic"),
        legend.text = element_text(size = 14,face = "italic"),
        legend.position = "top") +
  scale_colour_brewer(palette = "Set1", 
                      labels=c("Android @ Home",
                               "Android @ Work",
                               "iOS @ Home",
                               "iOS @ Work"))

#Exercise:
#Dissect the code for the plot line by line. 
#For each line, say what that layer is doing to the plot.


#Exercise: 
#1. Install the package "nlme". 
#2. Look at the description of the dataset `Oxboys`
#3. Is the data in wide or long format? Is the data tidy?
#4. Add 1 to the "age" column. 
#5. Plot the height trajectories of the boys, separated by subject.
# Draw a point for each observation and connect observations 
# within the same subject with a line. Remove the legend using 
# theme() and the `legend.position` argument.
# x = age, y = height
?Oxboys
head(Oxboys)

#btw this is called a spaghetti plot
gg = ggplot(Oxboys, aes(x = age + 1, 
                   y = height, 
                   group = Subject, 
                   colour = Subject)) + 
  geom_line() + 
  geom_point() + 
  theme(legend.position = "none")


ggsave(filename = "~/Desktop/oxford_boys_plot.png", 
       plot = gg)


#or
ggplot(Oxboys, aes(x = age + 1, 
                   y = height , 
                   color = Subject)) + 
  stat_summary(fun.y = identity, geom = "point") + 
  stat_summary(fun.y = identity, geom = "line") + 
  theme(legend.position = "none")

#NOTE:
#longitudinal data (time-varying measurements) need to be in 
#long format for ggplot to visualize



#reverse transformations: long to wide!
my_tidy_df1


(pivot_wider(my_tidy_df1, 
             names_from = lightSign, 
             values_from = Sales))

#Exercise:
# 1. Pivot my_tidy_df2 back into wide format. 

my_tidy_df2


pivot_wider(my_tidy_df2,
            names_from = sample,
            values_from = time)


# 2. Figure out how to get my_sep_tidy_df2 back to original form of my_df2. 

my_sep_tidy_df2

?separate

unite(my_sep_tidy_df2, 
      location, 
      time_of_day)



df <- expand_grid(x = c("a", NA), y = c("b", NA))
df

df %>% unite("z", x:y, remove = FALSE)

intermediate_df = my_sep_tidy_df2 %>% unite("sample", 
                          location:time_of_day, 
                          remove = TRUE)

pivot_wider(intermediate_df, 
            names_from = sample,
            values_from = time)


# Recap:
# pivot_longer()
# pivot_wider()
# separate()
# unite()


#-----------------------

###Review on Pipes!

# Without magrittr

my_tidy_df1 = pivot_longer(my_df1, 
                           cols = c(Fancy, Normal),
                           names_to = "lightSign", 
                           values_to = "Sales")

ggplot(my_tidy_df1,
       aes(x = City, 
           y = Sales, 
           group = lightSign, 
           fill = lightSign)) +
  geom_bar(stat = "identity", 
           position = "dodge") + 
  labs(fill="Sign Type") 

#-----------------------
# With magrittr
library(magrittr)

my_df1 %>%
  pivot_longer(cols = c(Fancy, Normal),
               names_to = "lightSign", 
               values_to = "Sales") %>%
  ggplot(aes(x = City, 
             y = Sales, 
             group = lightSign, 
             fill = lightSign)) +
  geom_bar(stat = "identity", 
           position = "dodge") + 
  labs(fill="Sign Type") 


### dplyr functions!!
#super useful 

#toy df 
demo_df = data.frame(num = c(1,2,3,4,5), 
                      color = c("blue", "yellow", "yellow", "blue", "blue"))

library(dplyr)

# select a column from a data frame 
demo_df %>% select(color)

demo_df %>% select(num)

demo_df %>% select(c(num, color))

### using flights.csv data
flights = read.csv("~/Desktop/repos/Intro-DS-S24/Data/flights.csv")
head(flights)

dim(flights)

#select demo
flights %>% select(c(dep, arr)) %>% head

flights %>% select(dep_delay:plane) %>% head
#colon is start:stop

flights %>% select(ends_with("delay")) %>% head

flights %>% select(contains("dep")) %>% head

#arrange demo
head(flights)
?arrange

demo_df %>% arrange(color)

demo_df %>% arrange(-num)

flights %>% arrange(dist)

flights %>% arrange(dist) %>% tail

flights %>% arrange(dest)

flights %>% arrange(dest) %>% tail

#mutate demo (review)
demo_df %>% mutate(squared = num^2,
                   num_by_2 = num/2)

library(stringr)
#how do I extract the hour of the departure?
flights$dep %>% 
  str_pad(width = 4, pad = "0") %>% 
  substr(start = 1, stop = 2)

View(flights)

flights = flights %>% mutate(dep_hr = dep %>% 
                               str_pad(width = 4, pad = "0") %>% 
                               substr(start = 1, stop = 2), 
                             dep_min = dep %>% 
                               str_pad(width = 4, pad = "0") %>% 
                               substr(start = 3, stop = 4))

flights = flights %>% mutate(arr_hr = arr %>% 
                               str_pad(width = 4, pad = "0") %>% 
                               substr(start = 1, stop = 2), 
                             arr_min = arr %>% 
                               str_pad(width = 4, pad = "0") %>% 
                               substr(start = 3, stop = 4))
flights %>% head

#Exercise: 
#Calculate expected duration of each flight using mutate. 


#Expected duration = how long the flight will take in hours and minutes
#e.g. if departure is 1400 and arrival is 1500, the expected duration is 
# 1 hour and 0 minutes long!

#Hint: use the dep_hr, dep_min, arr_hr, and arr_min columns we just created!

str(flights)

flights$dep_hr = flights$dep_hr %>% as.numeric()
flights$arr_hr = flights$arr_hr %>% as.numeric()
flights$dep_min = flights$dep_min %>% as.numeric()
flights$arr_min = flights$arr_min %>% as.numeric()

hr_diff = flights$arr_hr - flights$dep_hr
min_diff = flights$arr_min - flights$dep_min
min_diff_neg = (min_diff < 0) %>% as.numeric()


hr_diff = hr_diff - min_diff_neg
min_diff = min_diff + 60*min_diff_neg

flights = flights %>% mutate(hr_diff = hr_diff,
                  min_diff = min_diff)

flights = flights %>% mutate(duration = paste(hr_diff,"h",min_diff,"m"))

View(flights)

#optional shortcut
for(i in 15:18){
  flights[,i] = flights[,i] %>% as.numeric
}

flights %>% str

hour_diff = flights$arr_hr - flights$dep_hr
min_diff = flights$arr_min - flights$dep_min
negative_min = (min_diff < 0) %>% as.numeric

flights = flights %>% 
  mutate(duration = str_c(((hour_diff %>% mod(24)) - negative_min), " hours and ", min_diff %>% mod(60), " minutes."))
head(flights)
#1 hr 10 min

hour_diff[3]
min_diff[3]


### review of group_by() and summarise()
demo_df %>% 
  group_by(color) %>% 
  mutate(avgnum = mean(num))


demo_df %>% 
  group_by(color) %>% 
  summarise(avgnum = mean(num))


#Exercise:

# Calculate average expected departure delay grouped by carrier.

summary_tbl = flights %>% 
  group_by(carrier) %>% 
  summarise(avgdepdelay = mean(dep_delay, na.rm = TRUE))

# Which carrier has the longest delays on avg? Which has the shortest?

summary_tbl %>% arrange(avgdepdelay)

# Write out/Save the summary table as a .csv called "avg_departure_delay.csv".

write.csv(summary_tbl, file = "~/Desktop/avg_departure_delay.csv")

