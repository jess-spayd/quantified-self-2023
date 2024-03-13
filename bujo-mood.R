library(tidyverse)


bujo_mood$mood <- as_factor(bujo_mood$mood)
bujo_mood$mood <- fct_relevel(bujo_mood$mood,
                         "red", "orange", "yellow", "green", "blue", "purple")
bujo_mood$mood <- fct_recode(bujo_mood$mood,
                             "Lazy, Dull, Tired" = "blue",
                             "Happy, Energized, Motivated" = "green",
                             "Stressed, Anxious" = "orange",
                             "Sad, Depressed" = "purple",
                             "Angry, Irritable" = "red",
                             "Average, Normal, OK" = "yellow")


bujo_mood$month <- as_factor(bujo_mood$month)
bujo_mood$month <- fct_relevel(bujo_mood$month,
                              "January","February","March","April","May","June",
                              "July","August","September","October","November",
                              "December")
bujo_mood$month <- fct_recode(bujo_mood$month,
                              "Jan"="January",
                              "Feb"="February",
                              "Mar"="March",
                              "Apr"="April",
                              "May"="May",
                              "Jun"="June",
                              "Jul"="July",
                              "Aug"="August",
                              "Sep"="September",
                              "Oct"="October",
                              "Nov"="November",
                              "Dec"="December")


bujo_mood$day <- as_factor(bujo_mood$day)
bujo_mood$day <- fct_relevel(bujo_mood$day,
                             "Sunday","Monday","Tuesday","Wednesday",
                             "Thursday","Friday","Saturday")
bujo_mood$day <- fct_recode(bujo_mood$day,
                            "Sun"="Sunday",
                            "Mon"="Monday",
                            "Tue"="Tuesday",
                            "Wed"="Wednesday",
                            "Thu"="Thursday",
                            "Fri"="Friday",
                            "Sat"="Saturday")



mood_month <- bujo_mood %>%
  group_by(month, mood) %>%
  count()

  
  
ggplot(mood_month, aes(fill=mood,x=month,y=n))+
  geom_bar(position="fill",stat="identity") +
  scale_fill_manual(values=c("red4","orange3","yellow3","green4",
                             "skyblue3","purple4")) +
  theme_classic()+
  labs(title="My Moods in 2023",
       x="Month",
       y="Proportion",
       fill="Mood")+
  theme(plot.title = element_text(face = "bold"))



mood_weekday <- bujo_mood %>%
  group_by(day, mood) %>%
  count()


ggplot(mood_weekday, aes(fill=mood,x=day,y=n))+
  geom_bar(position="dodge",stat="identity") +
  scale_fill_manual(values=c("red4","orange3","yellow3","green4",
                             "skyblue3","purple4")) +
  theme_classic()+
  labs(title="Moods & Day of the Week",
       x="Weekday",
       y="Count",
       fill="Mood")+
  theme(plot.title = element_text(face = "bold"))


mood_count <- bujo_mood %>%
  group_by(mood) %>%
  count()

ggplot(mood_count, aes(x=mood,y=n)) +
  geom_bar(stat="identity")

summary(bujo_mood$mood)
