Movies.IMDB$vote_average<- as.numeric(Movies.IMDB$vote_average)
Movies.IMDB$vote_count<- as.numeric(Movies.IMDB$vote_count)
Movies.IMDB$budget<- as.numeric(Movies.IMDB$budget)
Movies.IMDB$revenue<- as.numeric(Movies.IMDB$revenue)
Movies.IMDB$popularity<- as.numeric(Movies.IMDB$popularity)
Movies.IMDB$AverageRating<- as.numeric(Movies.IMDB$AverageRating)
Movies.IMDB$IMDB_Rating<- as.numeric(Movies.IMDB$IMDB_Rating)
Movies.IMDB$Meta_score<- as.numeric(Movies.IMDB$Meta_score)
Movies.IMDB$overview_sentiment<- as.numeric(Movies.IMDB$overview_sentiment)

#correlation matrix
library(dplyr)
numeric_data <- Movies.IMDB %>% 
  select(where(is.numeric))

correlation_matrix <- cor(numeric_data, use = "complete.obs")

print(correlation_matrix)

# install.packages("corrplot")

library(corrplot)

corrplot(correlation_matrix, method = "color", type = "upper", 
         tl.col = "black", tl.srt = 45)

#install.packages("ggpubr")

#correlation scatter plot
library(ggpubr)

ggscatter(Movies.IMDB, 
          x = "budget", 
          y = "revenue",
          color = "gold",  
          add = "reg.line",        
          conf.int = TRUE,         
          cor.coef = TRUE,         
          cor.method = "pearson",  
          xlab = "Budget", 
          ylab = "Revenue") +
theme_minimal() +
  theme(
    plot.background = element_rect(fill = "black"),
    panel.background = element_rect(fill = "black"),
    text = element_text(color = "gold"),
    axis.text = element_text(color = "gold"),
    axis.title = element_text(color = "gold"),
    plot.title = element_text(color = "gold", face = "bold", size = 14)
  )

#Q_Q plot
par(bg = "black", col.axis = "gold", col.lab = "gold", col.main = "gold")

# Q-Q plot
qqnorm(Movies.IMDB$runtime,
       main = "Q-Q Plot of Movie Runtime",
       col = "gold",
       pch = 19) 

qqline(Movies.IMDB$runtime,
       col = "white", 
       lwd = 2)


grid(col = "white", lty = "dotted")  

#heatmap
#install.packages("ggcorrplot")

library(ggcorrplot)

numeric_data <- Movies.IMDB %>% select(where(is.numeric))

correlationMatrix <- round(cor(numeric_data, use = "complete.obs"), 1)

library(corrplot) 

cor.mtest <- function(mat, conf.level = 0.95) {
  mat <- as.matrix(mat)
  n <- ncol(mat)
  p.mat <- matrix(NA, n, n)
  diag(p.mat) <- 0
  for (i in 1:(n - 1)) {
    for (j in (i + 1):n) {
      tmp <- cor.test(mat[, i], mat[, j], conf.level = conf.level)
      p.mat[i, j] <- p.mat[j, i] <- tmp$p.value
    }
  }
  colnames(p.mat) <- rownames(p.mat) <- colnames(mat)
  p.mat
}

pMatrix <- cor.mtest(numeric_data)

corrHeatmapPlot <- ggcorrplot(
  correlationMatrix,
  hc.order = TRUE,      
  type = "lower",       
  outline.col = "white",
  p.mat = pMatrix,      
  sig.level = 0.05,     
  insig = "pch"         
)

corrHeatmapPlot

#install.packages("plotly")

library(plotly)

ggplotly(corrHeatmapPlot)

#linear regression
#install.packages("dplyr")
#install.packages("ggplot2")

library(dplyr)
library(ggplot2)

Movies.IMDB_clean <- Movies.IMDB %>%
  select(revenue, budget, runtime, vote_average) %>%
  mutate(
    revenue = as.numeric(revenue),
    budget = as.numeric(budget),
    runtime = as.numeric(runtime),
    vote_average = as.numeric(vote_average)
  ) %>%
  filter(!is.na(revenue), !is.na(budget), !is.na(runtime), !is.na(vote_average))

mlr_model <- lm(revenue ~ budget + runtime + vote_average, data = Movies.IMDB_clean)

Movies.IMDB_clean$predicted_revenue <- predict(mlr_model, newdata = Movies.IMDB_clean)

ggplot(Movies.IMDB_clean, aes(x = revenue, y = predicted_revenue)) +
  geom_point(color = "gold", alpha = 0.6) +
  geom_smooth(method = "lm", color = "white", se = TRUE) +
  labs(title = "Multiple Linear Regression: Actual vs Predicted Revenue",
       x = "Actual Revenue",
       y = "Predicted Revenue") +
  theme_minimal() +
  theme(
    plot.background = element_rect(fill = "black", color = NA),
    panel.background = element_rect(fill = "black", color = NA),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    text = element_text(color = "gold"),
    axis.text = element_text(color = "gold"),
    axis.title = element_text(color = "gold"),
    plot.title = element_text(color = "gold", face = "bold", size = 14)
  )