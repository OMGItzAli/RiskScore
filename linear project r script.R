wine <- read.csv("C:/Users/itzal/OneDrive/Desktop/UH LIFE/YEAR 4 UH GRAD/Fall 2021/MATH 6357 Linear Models and Design of Experiments/project/winequalityN.csv")

#Question: Can we predict the wine quality score from the objective measures
#like acidity and sulphates.(red and white wines)


#We are testing if acidity has an impact on wine quality 


fixed_acid = wine$fixed.acidity
volatile_acid = wine$volatile.acidity
citric_acid = wine$citric.acid


quality = wine$quality # response variable 

#Ho: Fixed acidity, volatile acidity, or  citric acidity is not significant when predicting 
#Ha: Fixed acidity, volatile acidity, or  citric acidity is significant when predicting

acid_model = lm(quality~ fixed_acid + volatile_acid + citric_acid)

summary(acid_model)
# according the the summary from above, we could 

#----------------------------------------------------------------------------------------------------

wine_model=lm(Wine$quality~.)
