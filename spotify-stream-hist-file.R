library(jsonlite) 
library(tidyverse)

streaming_history0 <- fromJSON('StreamingHistory0.json')
streaming_history1 <- fromJSON('StreamingHistory1.json')

spotify_streaming_history_2023 <- bind_rows(streaming_history0,
                                            streaming_history1)

write_csv(spotify_streaming_history_2023, 
          'spotify_streaming_history_2023.csv')
