#' print
#'
#' @param x An object of class Trapezoid or Simpson
#'
#' @return An estimation of the integral
#' @author Jonah Klein-Barton
#' @note This is a very simple function
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
