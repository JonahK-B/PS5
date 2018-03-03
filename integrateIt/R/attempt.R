
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
              T <- (h/2)*(Y[1] + sum(2*Y[2:(length(Y)-1)]) + Y[length(Y)])
            }
            if (Rule == "Simpson"){
              T <- (h/3)*(Y[1] + sum(c(4,2)*Y[2:(length(Y)-2)]) + 4*Y[length(Y)-1] + Y[length(Y)])
            }
            return(T)
          }
)
integrateIt(X,Y,c(1,5), "Trap")
