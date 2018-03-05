
## Load libraries and set working directory
library(devtools)
library(roxygen2)
setwd("C:\Users\jonah\Documents\GitHub\PS5") #This will need to be changed to match your directory

## This is run once when the package strcuture is first created


## At this point put the *.R files into the correct directories and edit the DESCRIPTION file

## Let's look through the R directory in this order:



# Now the NAMESPACE

## This can be run many times as the code is updates
current.code <- as.package("integrateIt")
load_all(current.code)
document(current.code)
test(current.code)
## Let's look at a function


## Let's try it out
x = c(1,2,3,4,5)
y = c(1,4,9,16,25)
integrateIt(x,y,c(1,5),"Simpson")
integrateIt(x,y,c(1,5),"Trap")

myTrap <- new("Trapezoid", bounds = c(1,5), X = c(1,2,3,4,5), Y = c(1,4,9,16,25), integral = 42)
print(myTrap)

mySimpson <- new("Simpson", bounds = c(1,5), X = c(1,2,3,4,5), Y = c(1,4,9,16,25), integral = 41.33333)
print(mySimpson)

##Things which should throw errors

##Bounding error
mySimpson <- new("Simpson", bounds = c(1,4), X = c(1,2,3,4,5), Y = c(1,4,9,16,25), integral = 42)

## Input length error
mySimpson <- new("Simpson", bounds = c(1,5), X = c(1,2,3,4,5), Y = c(1,4,9,16,25,36), integral = 42)

