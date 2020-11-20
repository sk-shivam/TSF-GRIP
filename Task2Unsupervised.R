# Task-2 Clustering
# Author- Shivam Khandelwal
# From the Given Iris Dataset, we need to figure out the number of optimal clusters and visualise the result.
# Importing required Libraries:
library(datasets)
library(ggplot2)
library(dplyr)
library(factoextra)
library(stats)
library(gridExtra)
library(grid)

# Loading the data and looking for a statistical summary:
data("iris")
summary(iris)

# Visualizing the Iris Dataset pattern and detailed visualisation of length and width.
# First 10 rows

head(iris, n=10)

# GridPlot for 4 different boxplots to compare the Sepal and Petal's Length and Width for whole data.

p1<- ggplot(iris, aes(Species, Sepal.Length, fill= Species))+geom_boxplot()+theme(legend.position = "none")
p2<- ggplot(iris, aes(Species, Sepal.Width, fill= Species))+geom_boxplot()+theme(legend.position = "none")
p3<- ggplot(iris, aes(Species, Petal.Length, fill= Species))+geom_boxplot()+theme(legend.position = "none")
p4<- ggplot(iris, aes(Species, Petal.Width, fill= Species))+geom_boxplot()+theme(legend.position = "none")

grid.arrange(p1  + ggtitle(""),
             p2  + ggtitle(""),
             p3 + ggtitle(""),
             p4 + ggtitle(""),
             nrow = 2,
             top = textGrob("Sepal and Petal Box Plot", 
                            gp=gpar(fontsize=10))
)


# Visualizing the optimal number of clusters using the Elbow method and we can see the elbow forming at 3 and then "Total Within Sum of Squares" remained almost same and didn't decrease significantly.
fviz_nbclust(x = (iris[, 3:4]),FUNcluster = kmeans, method = 'wss')

# Defining the kmeans algorithm and setting clusters to be 3
clusters<- kmeans(scale(iris[, 3:4]), 3, nstart = 1)

# Now Visualising these clusters to see the details of the dataset and how the clusters are formed.
fviz_cluster(clusters, data = iris[, 3:4])