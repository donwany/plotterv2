
# PlotterV2


# Install the pracma package if not already installed
if (!requireNamespace("pracma", quietly = TRUE)) {
  install.packages("pracma")
}

# Load necessary libraries
library(ggplot2)
library(pracma)

#' Define a function to read data from a CSV file
#' @param file_path read the file path to the csv file
#' @return the data frame of the input file
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
#' @param dataframe the data frame to plot
#' @param x_col the x-column of the data frame
#' @param y_col the y-column of the data frame
#' @param title the title of the scatter plot
#' @return the scatter plot diagram
#' @examples
#' create_scatter_plot(df, x='weight', y='age', title='scatter plot')
#' @export
create_scatter_plot <- function(data, x_column, y_column, title) {
  plot <- ggplot(data = data, aes(x = data[, x_column], y = data[, y_column])) +
    geom_point() +
    labs(title = title)
  return(plot)
}


#' function performing statistical analysis to estimate the parameters
#' of a normal distribution for a given data set along with a confidence intervals
#' for the mean and standard deviation.
#'
#' @param x Input data set
#' @param alpha significance level
#' @returns Return a list containing the following elements: G, V, Cov, StdErr, ConfInts
#' @examples
#' x = c(2, 4, 6, 8, 10, 30, 45, 55)
#' estegn(x, alpha = 0.01)
#' @export
estegn <- function(x, alpha = 0.05) {
  n <- length(x)
  mu <- mean(x)
  sigma <- sqrt(var(x) / n)
  t_value <- qt(1 - alpha / 2, df = n - 1)
  mu_lower <- mu - t_value * sigma / sqrt(n)
  mu_upper <- mu + t_value * sigma / sqrt(n)
  sigma_lower <- sqrt((n - 1) * var(x) / qchisq(1 - alpha / 2, df = n - 1))
  sigma_upper <- sqrt((n - 1) * var(x) / qchisq(alpha / 2, df = n - 1))
  G <- matrix(c(mu, sigma), nrow = 2)
  V <- matrix(c(sigma^2 / n, 0, 0, sigma^4 / (n * (n - 1))), nrow = 2)
  Cov <- V
  StdErr <- sqrt(diag(Cov))
  ConfInts <- cbind(c(mu_lower, sigma_lower), c(mu_upper, sigma_upper))
  return(list(G, V, Cov, StdErr, ConfInts))
}

#' function to solve the quadratic equation
#' @param a value for a
#' @param b value for b
#' @param c value for c
#' @examples
#' a <- 1; b <- -3; c <- 4
#' roots <- solve_quadratic(a, b, c)
#' cat("Roots:", roots, "\n")
#'
#' a <- 2; b <- -3; c <- 1
#' roots <- solve_quadratic(a, b, c)
#' cat("Roots:", roots, "\n")
#'
#' @export
solve_quadratic <- function(a, b, c) {
  # Calculate the discriminant
  discriminant <- b^2 - 4 * a * c

  # Check if the discriminant is non-negative
  if (discriminant >= 0) {
    # Calculate the two solutions
    root1 <- (-b + sqrt(discriminant)) / (2 * a)
    root2 <- (-b - sqrt(discriminant)) / (2 * a)

    # Return the solutions as a vector
    return(c(root1, root2))

  } else if (discriminant < 0) {
    # If the discriminant is negative, return a complex number
    complex_root <- -b / (2 * a) + sqrt(-discriminant) / (2 * a) * 1i
    return(c(complex_root, Conj(complex_root)))

  } else {
    # If the discriminant is zero, return a single solution
    root <- -b / (2 * a)
    return(root)
  }
}

