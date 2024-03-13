library(tidyverse)

# read csv
spotify_2023 <- read_csv('spotify_streaming_history_2023.csv')

# convert milliseconds played to minutes played
spotify_2023$minPlayed <- round((spotify_2023$msPlayed * (1/60000)),2)

# plays per artist
artist_plays <- spotify_2023 %>%
  group_by(artistName) %>%
  count()

#ggplot(artist_plays_top, aes(x=artistName, y=n)) +
#  geom_bar(stat='identity')

# minutes per artist
artist_min <- spotify_2023 %>%
  group_by(artistName) %>%
  summarize(totalMin=sum(minPlayed))

artist_min_top <- spotify_2023 %>%
  group_by(artistName) %>%
  summarize(totalMin=sum(minPlayed)) %>%
  slice_max(order_by=totalMin, n=5)

## bar plot
artist_min_top %>%
  mutate(artistName = fct_reorder(artistName, desc(totalMin))) %>%
  ggplot(aes(artistName, totalMin)) +
  geom_col(fill='purple4') +
  theme_classic()+
  labs(title = "Top 5 Artists",
       x="Artist",
       y="Total minutes played") +
  theme(plot.title = element_text(face = "bold"))

# artist csv
artists <- merge(artist_min, artist_plays)
write_csv(artists, 'spotify_2023_artists.csv')

# plays per song
song_plays <- spotify_2023 %>%
  group_by(artistName, trackName) %>%
  count()

## histograms of plays per song
hist(song_plays$n, breaks=12)

ggplot(song_plays, aes(n)) +
  geom_bar()

## density plot of plays per song
ggplot(song_plays, aes(n)) +
  geom_density(fill='black')


#song_plays_top <- spotify_2023 %>%
#  group_by(artistName, trackName) %>%
#  count() %>%
#  slice_tail(n=5)

#song_plays %>%
#  slice_tail(n=5) %>%
#  ggplot(aes(x=trackName,y=n)) +
#  geom_col()


spotify_2023$month <- month(spotify_2023$endTime, label=T)


min_by_month <- spotify_2023 %>%
  group_by(month) %>%
  summarise_at(vars(minPlayed),
               list(minSum=sum))

ggplot(min_by_month, aes(x=month,y=minSum))+
  geom_bar(stat="identity")


boygenius_by_month <- spotify_2023 %>%
  subset(artistName=="boygenius") %>%
  group_by(month) %>%
  summarise_at(vars(minPlayed),
               list(minSum=sum))


boygenius_missing_months <- data.frame(month=c("Feb","Mar"),
                                       minSum=c(0,0))

boygenius_by_month <- rbind(boygenius_by_month, boygenius_missing_months)


ggplot(boygenius_by_month, aes(x=month,y=minSum)) +
  geom_bar(stat="identity")


boygenius_2023 <- subset(spotify_2023, artistName=="boygenius")

boygenius_2023$week <- week(boygenius_2023$endTime)

boygenius_time <- boygenius_2023 %>%
  group_by(week) %>%
  summarise_at(vars(minPlayed),
               list(minSum=sum))


ggplot(boygenius_time, aes(x=week,y=minSum)) +
  geom_area()


ggplot(boygenius_2023, aes(x=endTime,y=minPlayed))+
  geom_point()

ggplot(boygenius_by_month, aes(x=month, y=minSum))+
  geom_line()

boygenius_2023$date <- date(boygenius_2023$endTime)

boygenius_daily <- boygenius_2023 %>%
  group_by(date) %>%
  summarise_at(vars(minPlayed),
               list(minSum=sum))
  

ggplot(boygenius_daily, aes(x=date,y=minSum))+
  geom_bar(stat="identity")+
  geom_vline(xintercept=date("2023-06-16"),color='red')+
  geom_vline(xintercept=date("2023-09-30"),color='red')

ggplot(boygenius_time, aes(x=week,y=minSum))+
  geom_bar(stat="identity",fill="black")+
  geom_vline(xintercept=24.21,color='red')+
  geom_text(x=29, y=840, label="Jun 16 concert", color='red')+
  geom_text(x=29, y=805, label="@ Merriweather", color='red')+
  geom_vline(xintercept=39.36,color='red') +
  geom_text(x=44, y=840, label="Sep 30 concert", color='red')+
  geom_text(x=44, y=805, label="@ the Mann", color='red')+
  geom_vline(xintercept=13.6,color='red') +
  geom_text(x=9, y=840, label="The Record", color='red')+
  geom_text(x=9, y=805, label="released Mar 31", color='red')+
  theme_classic()+
  labs(title="boygenius Listening by Week",
       x="Time",
       y="Minutes Played")+
  theme(plot.title = element_text(face = "bold"))+
  scale_x_continuous(breaks=c(0,7,15.7,24.15,33.5,42,50.5),
                     labels=c("January","February","April","June","August",
                              "October","December"))
