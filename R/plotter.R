
# PlotterV2

# Load necessary libraries
library(ggplot2)

#' Define a function to read data from a CSV file
#' @param file_path read the file path to the csv file
#' @return the dataframe of the input file
#' @examples
#' df = read_data_from_csv("data.csv")
#' @export
read_data_from_csv <- function(file_path) {
  if(endsWith(file_path, ".csv")){
    data <- read.csv(file_path, header = TRUE)
  }else{
    cat("The file does not end with .csv\n")
  }
  return(data)
}

#' Define a function to create a scatter plot
#'
#' @param dataframe the dataframe to plot
#' @param x_col the x-column of the dataframe
#' @param y_col the y-column of the dataframe
#' @param title the title of the scatter plot
#' @return the scatterplot diagram
#' @examples
#' create_scatter_plot(df, x='weight', y='age', title='scatter plot')
#' @export
create_scatter_plot <- function(data, x_column, y_column, title) {
  plot <- ggplot(data = data, aes(x = data[, x_column], y = data[, y_column])) +
    geom_point() +
    labs(title = title)
  return(plot)
}
