
rm(list = ls())

library(ggplot2)
library(tidyverse)
library(ggfortify)
library(fastICA)
library(datasets)

df <- iris[c(1,2,3,4)]
ir.pca <- prcomp(df)
autoplot(ir.pca,data=iris,colour='Species')
dev <- ir.pca$sdev
print(round(dev/sum(dev),digits=2))
