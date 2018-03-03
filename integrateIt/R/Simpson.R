#' An estimated integral of a function
#'
#' Object of class \code{SquaresPack} are created by the \code{addSquares} and \code{subtractSquares} functions
#'
#'
#' An object of the class `Simpson' has the following slots:
#' \itemize{
#' \item \code{bounds} The lower bound and upper bound of the intergrand
#' \item \code{X} An ordered list of X values, between a and b
#' \item \code{Y} An ordered list of Y values, where Yn = F(Xn)
#' \item \code{integral} An estimate of the integral

#' }
#'
#' @author Jonah Klein-Barton: \email{jonahkleinbarton@@gmail.com}
#' @rdname Simpson
#' @export
setClass(Class = "Simpson",
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
setMethod("initialize", "Simpson", function(.Object, ...) {
  value = callNextMethod()
  validObject(value)
  return(value)
}
)
#'@export
setValidity("Simpson", function(object){
  test1 <- (object@X[1] <= object@X[length(object@X)])
  if(!test1){return("b must be the upper bound and a must be the lower bound")}
}
)
