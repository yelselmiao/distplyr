#' Probability Density Function
#'
#' Access a distribution's probability density function (pdf).
#'
#' @inheritParams get_cdf
#' @return A vector of the evaluated density, in the case of \code{eval_}; a
#'   data frame with both the argument and function evaluations, in the case of
#'   \code{enframe_}; or a vectorized function representing the density, in the
#'   case of \code{get_}.
#' @examples
#' d <- dst_unif(0, 4)
#' eval_density(d, at = 0:4)
#' enframe_density(d, at = 0:4)
#' density <- get_density(d)
#' density(0:4)
#' @family distributional representations
#' @rdname density
#' @export
eval_density <- function(object, at) UseMethod("eval_density")

#' @rdname density
#' @export
get_density <- function(object) UseMethod("get_density")


#' @export
eval_density.dst <- function(object, at) {
	f <- object[["representations"]][["density"]]
	if (!is.null(f)) return(f(at))
	if (variable(object) != "continuous") return(NULL)
	stop("Can't find a probability function for this distribution.")
}

#' @export
get_density.dst <- function(object) {
	f <- object[["representations"]][["density"]]
	if (!is.null(f)) return(f)
	if (variable(object) != "continuous") return(NULL)
	function(at) eval_density(object, at = at)
}

#' @rdname density
#' @export
enframe_density <- function(object, at,
							 arg_name = ".arg",
							 fn_name = ".density") {
	UseMethod("enframe_density")
}

#' @export
enframe_density.dst <- function(object, at,
								 arg_name = ".arg",
								 fn_name = ".density") {
	f <- eval_density(object, at = at)
	if (is.null(f)) return(NULL)
	res <- data.frame(at, f)
	names(res) <- c(arg_name, fn_name)
	res
}
