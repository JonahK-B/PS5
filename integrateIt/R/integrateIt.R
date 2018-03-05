#' integrateIt
#'
#' @param X A list of even partitions of the bounds that the integral is beign taken on.
#' @param Y A numeric list with the same dimensionality as \code{x}, equal to the height of the function at each X value. X and Y form sets of ordered pairs.
#' @param bounds The minimum and maximum X values.
#' @param Rule Can be either "Trap" or "Simpson". Determines which form of estimation the method will use to estimate the integral
#'
#'
#' @return An object of class Squares containing
#'  \item{object}{An object of class Simpson or Trapezoid}
#' @author Jonah Klein-Barton
#' @note This is a very simple function
#' @examples
#'
#' myX <- c(1,2,3,4,5)
#' myY <- c(1,4,9,16,25)
#' integrateIt(myX, myY, c(1,5), "Trap")
#' @rdname integrateIt
#' @export
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
              integral = new("Trapezoid", bounds = bounds, X = X, Y = Y, integral = I)
            }
            if (Rule == "Simpson"){
              I <- (h/3)*(Y[1] + sum(c(4,2)*Y[2:(length(Y)-2)]) + 4*Y[length(Y)-1] + Y[length(Y)])
              integral = new("Simpson", bounds = bounds, X = X, Y = Y, integral = I)
            }
            return(integral)
          }
)


