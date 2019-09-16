
rm(list = ls())

library(ggplot2)
library(tidyverse)
library(ggfortify)
library(fastICA)
library(datasets)

df <- iris[c(1,2,3,4)]
a <- fastICA(df, 7, alg.typ = "parallel", fun = "logcosh", alpha = 1,
             method = "R", row.norm = FALSE, maxit = 200,
             tol = 0.0001, verbose = TRUE)
heatmap(a$S)
