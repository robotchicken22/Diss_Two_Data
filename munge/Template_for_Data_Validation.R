#Load in the cars dataset
data(mtcars)
head(cars,3)
data("SBS2000")

#Validating data is about checking whether a data set meets
#presumptions or expectations that you have for the data
#the 'validate' package makes it easy for you to define those
#expectations:

install.packages('validate')
library(validate)

#We can define these expectations in the following code:
head(mtcars)
rules<-validator(speed>=0,
                 dist>=0,
                 speed/dist<=1.5,
                 cor(speed,dist)>=0.2)

#Now we have define the rules of the dataset, we can use
#use the following to see whether the assumptions are true
#for all the records within the dataset:
out <-confront(cars, rules)

#Then we can check the results of the validation using the 
#following code

summary(out)

#Even this is difficult to interpret, so we can use the plot
#function to get a better display of this data:

plot(out)

#The next part ofdata validation is the use of variable checks
#These are performed on a field-by-field basis. An example would be to check that the age
#is nonnegative, or of integer type.
is.numeric(mtcars[3])
is.character(mtcars[3])
mtcars(3)
mtcars[3]

#To demand that all items must be present or absent for
#a certain variable, use R's quanitfiers any() or all():

rules2 <-validator(
  !any(is.na(incl.prob)),
  all(is.na(vat))
)
out2<-confront(SBS2000, rules2)
summary(out2)

#The results of this analysis show that their is 
#the presence of NA records, determined within the first
#line of the function. It shows that within the vat column of 
#the dataset, not all of them are NA values.

#Additional validation methods can be found at the following:
url = "https://ncl.instructure.com/courses/40029/modules/items/2005803"

