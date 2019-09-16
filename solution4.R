
rm(list = ls())

library(ggplot2)
library(tidyverse)
library(ggfortify)
library(fastICA)
library(datasets)

library(tidyverse)  # data manipulation
library(cluster)    # clustering algorithms
library(factoextra) # clustering algorithms & visualization

df <- iris[c(1,2,3,4)]

# function to compute average silhouette for k clusters
avg_sil <- function(k) {
  km.res <- kmeans(df, centers = k, nstart = 25)
  ss <- silhouette(km.res$cluster, dist(df))
  mean(ss[, 3])
}

# Compute and plot wss for k = 2 to k = 15
k.values <- 2:15

# extract avg silhouette for 2-15 clusters
avg_sil_values <- map_dbl(k.values, avg_sil)

plot(k.values, avg_sil_values,
     type = "b", pch = 19, frame = FALSE, 
     xlab = "Number of clusters K",
     ylab = "Average Silhouettes")

set.seed(20)
irisCluster <- kmeans(df,3)
irisCluster$cluster <- as.factor(irisCluster$cluster)
ggplot(df, aes(Petal.Length, Petal.Width, color = irisCluster$cluster)) + geom_point()

fviz_cluster(irisCluster, data=df)

