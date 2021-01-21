
#' Find the average speed sorted by month given a dataframe with MERRA-2 data
#'
#' @param promedioym A dataframe created from a CSV file with MERRA-2 data
#'
#' @return A dataframe with the average speed sorted by month
#' @importFrom utils str
#' @export

promedio_mes <- function(promedioym){
  A1 <- tapply(promedioym[ , 3], list(promedioym$Year, promedioym$Month), FUN= mean)
  A1[is.na(A1)] <- 0 # Buscar valores "NA" y sustituirlos por "0"

  A1 <- apply(A1, 2, FUN= mean)

  promedio_mes <- data.frame(
    A1
  )

  names(promedio_mes) <- c("Speed50")

  promedio_mes$Mes <- as.numeric(promedioym[ 1:12, 2])

  str(promedio_mes)

  return(promedio_mes)
}

