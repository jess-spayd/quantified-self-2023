library(tidyverse)
library(treemap)

nintendo_switch <- rename(nintendo_switch, 
                          "Lifetime Hours on Nintendo Switch" = `lifetime hours as of 3/12/2024`)

treemap(nintendo_switch,
        index=c("player","game"),
        vSize="Lifetime Hours on Nintendo Switch",
        type="index")






