library(tidyverse)
library(chron)
library(scales)

# read csv
sleep_log_2023 <- read_csv('sleep_log_2023.csv')
sleep_log_2023 <- distinct(sleep_log_2023)

# convert sleep duration to hours
sleep_log_2023$duration_ms <- sleep_log_2023$duration
sleep_log_2023$duration_h <- sleep_log_2023$duration_ms / 3600000

sleep_log_2023$startTime_hms <- hms::as_hms(sleep_log_2023$startTime)
sleep_log_2023$endTime_hms <- hms::as_hms(sleep_log_2023$endTime)

#median(times(sleep_log_2023$startTime_hms))
#mean(times(sleep_log_2023$endTime_hms))
#seconds_to_period(mean(period_to_seconds(sleep_log_2023$startTime)))
#format(mean(strptime(sleep_log_2023$startTime_hms, "%H:%M:%S")), "%H:%M:%S")
#hms::as_hms(mean(hms::as_hms(sleep_log_2023$startTime)))

## Months

sleep_log_2023$month <- month(sleep_log_2023$dateOfSleep, label=T)

## Days of the week

sleep_log_2023$dayOfWeek <- wday(sleep_log_2023$dateOfSleep, label = T)


# Start time hour
sleep_log_2023$startTime_bin <- as.character(sleep_log_2023$startTime_hms)
sleep_log_2023$startTime_bin <- str_sub(sleep_log_2023$startTime_bin,
                                                start=1,end=2)
sleep_log_2023$startTime_bin <- as.integer(sleep_log_2023$startTime_bin)
#sleep_log_2023$startTime_bin <- as_factor(sleep_log_2023$startTime_bin)
#sleep_log_2023$startTime_bin <- fct_relevel(sleep_log_2023$startTime_bin, 
 #                                                   '20','21','22','23','0','1')


#End time hour


sleep_log_2023$endTime_bin <- as.character(sleep_log_2023$endTime_hms)
sleep_log_2023$endTime_bin <- str_sub(sleep_log_2023$endTime_bin,
                                              start=1,end=2)
sleep_log_2023$endTime_bin <- as.integer(sleep_log_2023$endTime_bin)
#sleep_log_2023$endTime_bin <- as_factor(sleep_log_2023$endTime_bin)
#sleep_log_2023$endTime_bin <- fct_relevel(sleep_log_2023$endTime_bin, 
 #                                                 '20','21','22','23','0','1')




#sleep_log_2023_no_naps <- filter(sleep_log_2023, duration_h > 4)
#median(times(sleep_log_2023_no_naps$startTime_hms))

#hist(times(sleep_log_2023$startTime_hms))
#hist(times(sleep_log_2023$endTime_hms))

#hist(times(sleep_log_2023_no_naps$startTime_hms))
#hist(times(sleep_log_2023_no_naps$endTime_hms))

#ggplot(sleep_log_2023, aes(startTime_hms)) +
 # geom_histogram(binwidth=60*60, fill='white',color='gray')

#ggplot(sleep_log_2023, aes(endTime_hms)) +
 # geom_histogram(binwidth=60*60, fill='white',color='gray')




#####


#boxplot(sleep_log_2023$duration)
#boxplot(sleep_log_2023$startTime_hms)
#boxplot(sleep_log_2023$endTime_hms)

#range(sleep_log_2023$endTime_hms)

#Q_duration <- quantile(sleep_log_2023$duration, probs=c(.25, .75), na.rm = FALSE)
#iqr_duration <- IQR(sleep_log_2023$duration)


#Q_endTime <- quantile(sleep_log_2023$endTime_hms, probs=c(.25, .75), na.rm = FALSE)
#iqr_endTime <- IQR(sleep_log_2023$endTime_hms)



#sleep_log_2023_no_naps <- subset(sleep_log_2023, 
 #                         sleep_log_2023$duration > (Q_duration[1] - 1.5*iqr_duration) & 
  #                        sleep_log_2023$duration < (Q_duration[2]+1.5*iqr_duration) &
   #                       sleep_log_2023$endTime_hms > (Q_endTime[1] - 1.5*iqr_endTime) & 
    #                      sleep_log_2023$endTime_hms < (Q_endTime[2]+1.5*iqr_endTime))


#boxplot(sleep_log_2023_no_naps$duration)
#boxplot(sleep_log_2023_no_naps$startTime_hms)
#boxplot(sleep_log_2023_no_naps$endTime_hms)


#ggplot(sleep_log_2023_no_naps, aes(startTime_hms)) +
 # geom_histogram(binwidth=60*60, fill='white',color='gray')

#ggplot(sleep_log_2023_no_naps, aes(endTime_hms)) +
 # geom_histogram(binwidth=60*60, fill='white',color='gray')


#sleep_log_2023_no_naps$startTime_bin <- as.character(sleep_log_2023_no_naps$startTime_hms)
#sleep_log_2023_no_naps$startTime_bin <- str_sub(sleep_log_2023_no_naps$startTime_bin,
 #                                               start=1,end=2)
#sleep_log_2023_no_naps$startTime_bin <- as.integer(sleep_log_2023_no_naps$startTime_bin)
#sleep_log_2023_no_naps$startTime_bin <- as_factor(sleep_log_2023_no_naps$startTime_bin)
#sleep_log_2023_no_naps$startTime_bin <- fct_relevel(sleep_log_2023_no_naps$startTime_bin, 
 #                                                   '20','21','22','23','0','1')


#ggplot(sleep_log_2023_no_naps, aes(startTime_bin)) +
 # geom_bar(stat='count', fill='white',color='gray')



#sleep_log_2023_no_naps$endTime_bin <- as.character(sleep_log_2023_no_naps$endTime_hms)
#sleep_log_2023_no_naps$endTime_bin <- str_sub(sleep_log_2023_no_naps$endTime_bin,
 #                                               start=1,end=2)
#sleep_log_2023_no_naps$endTime_bin <- as.integer(sleep_log_2023_no_naps$endTime_bin)
#sleep_log_2023_no_naps$endTime_bin <- as_factor(sleep_log_2023_no_naps$endTime_bin)
#sleep_log_2023_no_naps$endTime_bin <- fct_relevel(sleep_log_2023_no_naps$endTime_bin, 
 #                                                   '20','21','22','23','0','1')


#ggplot(sleep_log_2023_no_naps, aes(endTime_bin)) +
 # geom_bar(stat='count', fill='white',color='gray')



## OR i could recast them to datetimes with all the same date for AMs and PMs?


# nap definition: start time after 6 am AND end time before 11 pm
# check: less than 4 hours

naps <- subset(sleep_log_2023, 
               startTime_bin > 6 & 
                 startTime_bin < 20 &
                 endTime_bin < 23 &
                 endTime_bin > 6)

sleep_no_naps <- anti_join(sleep_log_2023, naps)


## NAPS

#naps <- subset(sleep_log_2023, duration_h < 4)
#naps <- anti_join(sleep_log_2023, sleep_log_2023_no_naps)
  

mean(naps$duration_h)
min(naps$duration_h)
max(naps$duration_h)


#ggplot(naps, aes(startTime_hms)) +
 # geom_histogram(binwidth=60*60, fill='white',color='gray')

#ggplot(naps, aes(endTime_hms)) +
 # geom_histogram(binwidth=60*60, fill='white',color='gray')


ggplot(naps, aes(x=dayOfWeek)) +
  geom_bar(fill="aquamarine3")+
  theme_classic() +
  labs(title='Naps by Day of the Week',
       x="Day",
       y='Frequency')+
  theme(plot.title = element_text(face = "bold"))+
  scale_y_continuous(breaks=seq(from = 0, to = 11, by = 2))



ggplot(naps, aes(x=month)) +
  geom_bar(fill='gold2') +
  theme_classic()+
  labs(title='Naps per Month',
       x='Month',
       y='Frequency')+
  theme(plot.title = element_text(face = "bold")) +
  scale_y_continuous(breaks=seq(from = 0, to = 9, by = 3))



naps_month <- naps %>%
  group_by(month) %>%
  summarise_at(vars(duration_h),
               list(mean_duration_h = mean))

ggplot(naps_month, aes(x=month, y=mean_duration_h)) + 
  geom_bar(stat='identity') +
  theme_classic()


naps_dayOfWeek <- naps %>%
  group_by(dayOfWeek) %>%
  summarise_at(vars(duration_h),
               list(mean_duration_h = mean))

ggplot(naps_dayOfWeek, aes(x=dayOfWeek, y=mean_duration_h)) + 
  geom_bar(stat='identity') +
  theme_classic()

## SLEEPS

sleep_no_naps_grouped <- sleep_no_naps %>%
  group_by(dateOfSleep) %>%
  summarise_at(vars(duration_h),
               list(total_duration_h = sum))


mean(sleep_no_naps_grouped$total_duration_h)
max(sleep_no_naps_grouped$total_duration_h)
min(sleep_no_naps_grouped$total_duration_h)


sleep_no_naps$startTime_bin_relevel <- as_factor(sleep_no_naps$startTime_bin)
sleep_no_naps$startTime_bin_relevel <- fct_relevel(sleep_no_naps$startTime_bin_relevel, 
                                                   '20','21','22','23','0','1',
                                                   '4')
sleep_no_naps$startTime_bin_relevel <- factor(sleep_no_naps$startTime_bin_relevel,
                                              exclude = '4')

sleep_start <- subset(sleep_no_naps, startTime_bin != 4)

ggplot(sleep_no_naps, aes(startTime_bin)) +
  geom_histogram(bins=24, fill="white", color='gray')

ggplot(sleep_start, aes(startTime_bin_relevel)) +
  geom_bar(fill="chartreuse3")+
  theme_classic() +
  labs(title='Distribution of Bedtimes',
       x='Hour',
       y='Count of Sleeps') +
  theme(plot.title = element_text(face = "bold"))



sleep_no_naps$endTime_bin_relevel <- as_factor(sleep_no_naps$endTime_bin)



min(sleep_no_naps$endTime_bin)
max(sleep_no_naps$endTime_bin)

ggplot(sleep_no_naps, aes(endTime_bin)) +
  geom_histogram(bins=11, fill="white", color='gray') +
  theme_classic()

sleep_end <- subset(sleep_no_naps, endTime_bin > 3 &
                      endTime_bin < 12)

ggplot(sleep_end, aes(endTime_bin_relevel)) +
  geom_bar(fill="magenta3") +
  theme_classic()+
  labs(title='Distribution of Wake Up Times',
       x='Hour',
       y='Count of Sleeps')+
  theme(plot.title = element_text(face = "bold"))

mean(sleep_no_naps$endTime_bin)


sleep_start$startTime_skew <- sleep_start$startTime_bin_relevel
sleep_start$startTime_skew <- fct_recode(sleep_start$startTime_skew,
                                         '1' = '20',
                                         '2' = '21',
                                         '3' = '22',
                                         '4' = '23',
                                         '5' = '0',
                                         '6' = '1')
sleep_start$startTime_skew <- as.integer(sleep_start$startTime_skew)
sleep_start$startTime_skew <- sleep_start$startTime_skew + 19

start_month <- sleep_start %>%
  group_by(month) %>%
  summarise_at(vars(startTime_skew),
               list(mean_startTime = mean))

ggplot(start_month, aes(x=month, y=mean_startTime)) +
  geom_bar(stat='identity') +
  geom_smooth(method = 'lm')


end_month <- sleep_no_naps %>%
  group_by(month) %>%
  summarise_at(vars(endTime_bin),
               list(mean_endTime = mean))

ggplot(end_month, aes(x=month, y=mean_endTime)) +
  geom_bar(stat='identity') +
  geom_smooth(method = 'lm')


start_dayOfWeek <- sleep_start %>%
  group_by(dayOfWeek) %>%
  summarise_at(vars(startTime_skew),
               list(mean_startTime = mean))

end_dayOfWeek <- sleep_no_naps %>%
  group_by(dayOfWeek) %>%
  summarise_at(vars(endTime_bin),
               list(mean_endTime = mean))


ggplot(start_dayOfWeek, aes(x=dayOfWeek, y=mean_startTime)) +
  geom_bar(stat='identity') 
ggplot(end_dayOfWeek, aes(x=dayOfWeek, y=mean_endTime)) +
  geom_bar(stat='identity') 



sleeps_month <- sleep_no_naps %>%
  group_by(month) %>%
  summarise_at(vars(duration_h),
               list(mean_duration_h = mean))

ggplot(sleeps_month, aes(x=month, y=mean_duration_h)) + 
  geom_bar(stat='identity') +
  geom_smooth(method='lm')





sleeps_dayOfWeek <- sleep_no_naps %>%
  group_by(dayOfWeek) %>%
  summarise_at(vars(duration_h),
               list(mean_duration_h = mean))

ggplot(sleeps_dayOfWeek, aes(x=dayOfWeek, y=mean_duration_h)) + 
  geom_bar(stat='identity')
