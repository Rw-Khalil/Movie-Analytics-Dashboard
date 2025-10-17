library(dplyr)
library(ggplot2)
library(stringr)
Movies.IMDB <- Movies.IMDB %>%
  mutate(
    revenue = as.numeric(revenue),
    AverageRating = as.numeric(AverageRating)
  )

top100_revenue <- Movies.IMDB %>%
  filter(!is.na(revenue), !is.na(AverageRating)) %>%
  arrange(desc(revenue)) %>%
  slice_head(n = 100)

top100_revenue <- top100_revenue %>%
  mutate(revenue_bin = cut(revenue,
                           breaks = 5,
                           labels = c("Very Low", "Low", "Medium", "High", "Very High")))

ggplot(top100_revenue, aes(x = revenue_bin, y = AverageRating)) +
  stat_summary(fun = mean, geom = "bar", fill = "steelblue") +
  labs(
    title = "Average Rating by Revenue Category (Top 100 Movies)",
    x = "Revenue Category",
    y = "Average Rating"
  ) +
  theme_minimal()

