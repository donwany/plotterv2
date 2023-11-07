library(plotterv2)
library(ggplot2)

df = read_data_from_csv("~/Desktop/electricity_prices.csv")


PLT <- create_scatter_plot(data=df,
                           x_column="HB_PAN",
                           y_column="HB_WEST",
                           title='scatter plot of electricity')

PLT


