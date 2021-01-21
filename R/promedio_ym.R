
#' Find the average speed sorted by year and month given a dataframe with MERRA-2 data
#'
#' @param datos A dataframe created from a CSV file with MERRA-2 data
#'
#' @return A dataframe with the average speed sorted by year and month
#' @importFrom stats aggregate
#' @export

promedio_ym <- function(datos){

  dataframe1 <- aggregate(datos[ ,2], list(datos$Year, datos$Mes), FUN= mean)

  names(dataframe1) <- c("Year", "Month", "Speed50")
  dataframe1$Fecha <- as.POSIXct(paste(dataframe1$Year, dataframe1$Month, "01", sep= "-"), format="%Y-%m-%d")
  dataframe1 <- dataframe1[order(dataframe1$Fecha), ]

  return(dataframe1)
}

