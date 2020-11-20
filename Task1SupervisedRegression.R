# Task-1 Linear Regression
# Author- Shivam Khandelwal
# From the Given Student Scores Dataset, we need to make a Linear Regression model and predict the score for the student when Number of study hours= 9.25.
# Importing Required Libraries:

library(ggplot2)

# Loading the Dataset
df<- read.csv("StudentData.csv")

# Summarizing the Dataset
head(df, n=10)

summary(df)

# Visualizing the Data of Scores w.r.t. Hours
ggplot(df, aes(x=Hours, y=Scores)) + 
  geom_point()

# Checking the level of correlation
cor(df$Hours, df$Scores)
# We can see there is a strong co-relation between Number of Hours a Student Studied and Scores obtained by them.

# Defining a Linear Regression Model, training on all of the dataset
LinearReg <- lm(Scores ~ Hours, data=df)  # build linear regression model on full data
print(LinearReg)

# Summarizing the Linear Regression Model
summary(LinearReg)

# The model is statistically significant as p-value is smaller than 0.05 (p value: < 2.2e-16), and the p-value (<2e-16) for the predictor variable is also smaller
# Visualizing the Regression line
ggplot(df, aes(x=Hours, y=Scores)) + 
  geom_point()+stat_smooth(method = lm)

#Next looking for confidence interval for the model:
confint(LinearReg)

#Predicting the Score when study Hours=9.25
ScorePred <- predict(LinearReg, data.frame(Hours = c(9.25)))
ScorePred