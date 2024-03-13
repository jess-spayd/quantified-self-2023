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
