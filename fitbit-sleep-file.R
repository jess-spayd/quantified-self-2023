library(jsonlite)
library(tidyverse)

jan1 <- fromJSON("sleep-2022-12-20.json") 
feb <- fromJSON("sleep-2023-01-19.json") 
mar <- fromJSON("sleep-2023-02-18.json") 
apr <- fromJSON("sleep-2023-03-20.json") 
may <- fromJSON("sleep-2023-04-19.json") 
jun <- fromJSON("sleep-2023-05-19.json") 
jul <- fromJSON("sleep-2023-06-18.json") 
aug <- fromJSON("sleep-2023-07-18.json") 
sep <- fromJSON("sleep-2023-08-17.json") 
oct <- fromJSON("sleep-2023-09-16.json") 
nov <- fromJSON("sleep-2023-10-16.json") 
dec <- fromJSON("sleep-2023-11-15.json") 
jan2 <- fromJSON("sleep-2023-12-15.json") 

sleep_log_2023 <- bind_rows(jan1,feb)
sleep_log_2023 <- bind_rows(sleep_log_2023,mar) %>% bind_rows(apr) %>% 
  bind_rows(may) %>% bind_rows(jun) %>% bind_rows(jul) %>% bind_rows(aug) %>% 
  bind_rows(sep) %>% bind_rows(oct) %>% bind_rows(nov) %>% bind_rows(dec) %>%
  bind_rows(jan2)


sleep_log_2023 <- subset(sleep_log_2023, startsWith(sleep_log_2023$dateOfSleep, '2023'))

sleep_log_2023 <- select(sleep_log_2023, 'logId', 'dateOfSleep',
                         'startTime', 'endTime', 'duration')

sleep_log_2023 <- arrange(sleep_log_2023, dateOfSleep)

write_csv(sleep_log_2023, 'sleep_log_2023.csv')
