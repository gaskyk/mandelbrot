#############################################
# Produce Mandelbrot set using R            #
#                                           #
# Date: January 2019                        #
# Author: Gaskyk                            #
#############################################

# Import packages
library(mandelbrot)
library(ggplot2)

# Generate data to be used in picture
mb <- mandelbrot(xlim = c(-0.8335, -0.8325),
                 ylim = c(0.205, 0.206),
                 resolution = 1200L,
                 iterations = 1000)

# Blue palette
cols <- c(
  colorRampPalette(c("#FFF7FB", "#FFF7FB", "#ECE7F2",
                     "#D0D1E6", "#A6BDDB", "#74A9CF"))(10),
  colorRampPalette(c("#3690C0", "#3690C0", "#0570B0", 
                     "#045A8D", "#023858"), bias=2)(90),
  "black")

# Generate Mandelbrot picture
df <- as.data.frame(mb)
ggplot(df, aes(x = x, y = y, fill = value)) +
  geom_raster(interpolate = TRUE) + theme_void() +
  scale_fill_gradientn(colours = cols, guide = "none")


