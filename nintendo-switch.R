library(tidyverse)
library(treemap)

nintendo_switch <- rename(nintendo_switch, 
                          "Lifetime Hours on Nintendo Switch" = `lifetime hours as of 3/12/2024`)

treemap(nintendo_switch,
        index=c("player","game"),
        vSize="Lifetime Hours on Nintendo Switch",
        type="index")


avg_hours <- nintendo_switch %>%
  group_by(player) %>%
  summarise_at(vars("Lifetime Hours on Nintendo Switch"),
               list(mean_hours=mean))

med_hours <-nintendo_switch %>%
  group_by(player) %>%
  summarise_at(vars("Lifetime Hours on Nintendo Switch"),
               list(median_hours=median))



