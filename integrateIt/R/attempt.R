
X <- c(1,2,3,4,5)
Y <- c(1,4,9,16,25)
h <- (max(X) - min(X))/(length(X)-1)

### Trapezoid

T <- (h/2)*(Y[1] + sum(2*Y[2:(length(Y)-1)]) + Y[length(Y)])


### Simpson

T <- (h/3)*(Y[1] + sum(c(4,2)*Y[2:(length(Y)-2)]) + 4*Y[length(Y)-1] + Y[length(Y)])

setGeneric(name="integrateIt",
           def=function(X, Y, bounds, Rule)
           {standardGeneric("integrateIt")}
)

#' @export
setMethod(f="integrateIt",
          definition=function(X, Y, bounds, Rule){
            h <- (max(X) - min(X))/(length(X)-1)
            if (Rule == "Trap"){
              I <- (h/2)*(Y[1] + sum(2*Y[2:(length(Y)-1)]) + Y[length(Y)])
              integral = new("Trapezoid", bounds = c(min(X), max(X)), X = X, Y = Y, integral = I)
            }
            if (Rule == "Simpson"){
              I <- (h/3)*(Y[1] + sum(c(4,2)*Y[2:(length(Y)-2)]) + 4*Y[length(Y)-1] + Y[length(Y)])
              integral = new("Simpson", bounds = c(min(X), max(X)), X = X, Y = Y, integral = I)
            }
            XY <- data.frame(X, Y)
            return(c("object" = integral, "data" = XY, "integral" = I))
          }
)
integrateIt(X,Y,c(1,5), "Simpson")

setMethod(f="print", "Trapezoid",
          definition = function(x){
            return(x@integral)
          }
          )

setMethod(f="print", "Simpson",
          definition = function(x){
            return(x@integral)
          }
)
print(integral)
