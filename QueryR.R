library(dplyr)
library(ggplot2)
#Movies.IMDB$V8<- as.numeric(Movies.IMDB$V8)
#ovies.IMDB$V21<- as.numeric(Movies.IMDB$V21)
totalRuntime <- Movies.IMDB %>%
  #Make sure runtime & release year are not empty & filter by years starting from 2010 and up
  filter(!is.na(V8), !is.na(V21), V21 >= 2010) %>%
  group_by(V21) %>%
  summarise(total_runtime = sum(V8, na.rm = TRUE)) %>%
  arrange(desc(total_runtime))


ggplot(totalRuntime, aes(x = reorder(as.factor(V21), total_runtime),
                                  y = total_runtime)) +
  #Adding colour to the bar chart 
  geom_col(fill = "gold") +
  coord_flip() +
  labs(title = "Total Movie Runtime by Year (2010–Present)",
       x = "Release Year",
       y = "Total Runtime (mins)") +
  theme_minimal(base_family = "sans") +
  theme(
    plot.background = element_rect(fill = "black"),
    panel.background = element_rect(fill = "black"),
    text = element_text(color = "gold"),
    axis.text = element_text(color = "gold"),
    axis.title = element_text(color = "gold"),
    plot.title = element_text(color = "gold", face = "bold", size = 14)
  )
