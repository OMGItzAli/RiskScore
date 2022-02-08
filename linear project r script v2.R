library(corrplot)
library(ggplot2)


heart <- read.csv("C:/Users/itzal/OneDrive/Desktop/UH LIFE/YEAR 4 UH GRAD/Fall 2021/MATH 6357 Linear Models and Design of Experiments/project/heartRisk.csv")
attach(heart)
head(heart)


#Check residuals of linear model with all predictors for normality

heart_lm <- lm(Risk~as.factor(isMale)+as.factor(isBlack)+as.factor(isSmoker)+
                 as.factor(isHypertensive)+as.factor(isDiabetic)
               +Age+Systolic+Cholesterol+HDL)
qqnorm(resid(heart_lm), xlab = "Expected", ylab = "Residual")
qqline(resid(heart_lm))
print(shapiro.test(heart_lm$residuals))

#The residuals are not normally distributed as shown from the 
#normal plot and the Shapiro-Wilk normality test. We will attempt data transformation.

#-------------------Data Cleaning---------------------------------------

heart_s_lm <- lm((Risk^(.15))~as.factor(isMale)+as.factor(isBlack)+as.factor(isSmoker)+
                   as.factor(isHypertensive)+as.factor(isDiabetic)
                 +Age+Systolic+Cholesterol+HDL)
qqnorm(resid(heart_s_lm), xlab = "Expected", ylab = "Residual")
qqline(resid(heart_s_lm))
print(shapiro.test(heart_s_lm$residuals))

# The distribution of the residuals are now more normal than before after transforming the response by squaring the response.


#-------------------EDA: Exploratory Data Analysis---------------------------------------

pairs(heart)
corrplot(cor(heart))

#There seems to be a correlation between age and heart risk 

summary(heart_s_lm)
#---------------------------------------------------------------------------------

