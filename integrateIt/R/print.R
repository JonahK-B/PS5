#' print
#'
#' @param x An object of class Trapezoid or Simpson
#'
#' @return An estimation of the integral
#' @author Jonah Klein-Barton
#' @note This is a very simple function
#' @examples
#' myTrapezoid <- new ("Trapezoid", bounds = c(1,5), X = c(1,2,3,4,5), Y = c(1,4,9,16,25), integral = 42)
#' print(myTrapezoid)
#' @rdname print
#' @export



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
