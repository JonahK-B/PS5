#' An estimated integral of a function
#'
#' Object of class \code{SquaresPack} are created by the \code{addSquares} and \code{subtractSquares} functions
#'
#'
#' An object of the class `Trapezoid' has the following slots:
#' \itemize{
#' \item \code{bounds} The lower bound and upper bound of the intergrand
#' \item \code{X} An ordered list of X values, between a and b
#' \item \code{Y} An ordered list of Y values, where Yn = F(Xn)
#' \item \code{integral} An estimate of the integral
#' }
#'
#' @author Jonah Klein-Barton: \email{jonahkleinbarton@@gmail.com}
#' @rdname Trapezoid
#' @export
setClass(Class = "Trapezoid",
         representation = representation(
           bounds = "numeric",
           X = "numeric",
           Y = "numeric",
           integral = "numeric"
         ),
         prototype = prototype(
           bounds = c(),
           X = c(),
           Y = c(),
           integral = c()

         )
)
#' @export
setMethod("initialize", "Trapezoid", function(.Object, ...) {
  value = callNextMethod()
  validObject(value)
  return(value)
  }
)
#' @export
setValidity("Trapezoid", function(object){
  test1 <- (object@X[1] <= object@X[length(object@X)])
  test2 <- (object@X[1] == object@bounds[1] & object@X[length(object@X)] == object@bounds[2])
  test3 <- (length(object@X) == length(object@Y))
  if(!test1){return("b must be the upper bound and a must be the lower bound")}
  if(!test2){return("The domain of the function must be equal to the bounds of integration")}
  if(!test3){return("X and Y must be the same length")}
}
)
