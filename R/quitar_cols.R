
#' Eliminate aditional variables from your dataframe
#'
#' @param datos A dataframe created from a CSV file with MERRA-2 data
#'
#' @return Your original dataframe just with the variable Speed50
#' @importFrom utils str
#' @export

quitar_cols <- function(datos){
  datos$Direction50 <- NULL
  datos$Temp10 <- NULL
  datos$Temp2 <- NULL
  datos$Pressure <- NULL

  datos$Year <- as.factor(substr(datos$Date.time, 1, 4))
  datos$Mes <- as.factor(substr(datos$Date.time, 6, 7))
  str(datos)

  return(datos)
}
