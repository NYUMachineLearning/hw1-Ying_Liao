

library(ggplot2)
library(tidyverse)
library(ggfortify)
library(fastICA)
library(datasets)

X=as.matrix(iris[,1:4]);

K=3;

prevCentroids=matrix(0,K,dim(X)[2])
centroids=X[sample(1:dim(X)[1],K),]

dot=numeric(3)
C=numeric(150)

# while(!isTRUE(all.equal(centroids,prevCentroids)))
iter=2
for(m in 1:iter)
{
  for(i in 1:dim(X)[1])
  {
    for(j in 1:dim(centroids)[1])
    {
      dot[j]=(X[i,]-centroids[j,])%*%(X[i,]-centroids[j,])
    }
    C[i]=which.min(dot)
  }
  
  prevCentroids=centroids
  
  for(k in 1:K)
  {
    centroids[k,]=colMeans(X[which(C==k),])
  }
}

