
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

hierarchical_dist_euc <- dist(df, method = "euclidean")
hierarchical_dist_max <- dist(df, method = "maximum")

tree_euc_avg <- hclust(hierarchical_dist_euc, method="average")
tree_euc_cmp <- hclust(hierarchical_dist_euc, method="complete")
tree_max_avg <- hclust(hierarchical_dist_max, method="average")
tree_max_cmp <- hclust(hierarchical_dist_max, method="complete")

tree_k2 <- cutree(tree_euc_avg, k = 2)
tree_k3 <- cutree(tree_euc_avg, k = 3)

plot(tree_k2)
plot(tree_k3)
plot(tree_euc_cmp)
plot(tree_max_avg)
plot(tree_max_cmp)

df_copy <- df
df_copy$label <- as.factor(tree_k3)

ir.pca <- prcomp(df)
autoplot(ir.pca,data=df_copy,colour='label')

