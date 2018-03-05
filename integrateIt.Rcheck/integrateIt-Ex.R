pkgname <- "integrateIt"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
options(pager = "console")
library('integrateIt')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
cleanEx()
nameEx("integrateIt")
### * integrateIt

flush(stderr()); flush(stdout())

### Name: integrateIt
### Title: integrateIt
### Aliases: integrateIt

### ** Examples


myX <- c(1,2,3,4,5)
myY <- c(1,4,9,16,25)
integrateIt(myX, myY, c(1,5), "Trap")



cleanEx()
nameEx("print")
### * print

flush(stderr()); flush(stdout())

### Name: print,Trapezoid-method
### Title: print
### Aliases: print,Trapezoid-method

### ** Examples

myTrapezoid <- new ("Trapezoid", bounds = c(1,5), X = c(1,2,3,4,5), Y = c(1,4,9,16,25), integral = 42)
print(myTrapezoid)



### * <FOOTER>
###
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
