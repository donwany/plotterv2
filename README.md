### Usage
```r
library(plotterv2)
library(ggplot2)

# Read data
df = read_data_from_csv("~/Desktop/electricity_prices.csv")

# Plot scatter
plt <- create_scatter_plot(data=df,
                           x_column="HB_PAN",
                           y_column="HB_WEST",
                           title='scatter plot of electricity')

plt
```
