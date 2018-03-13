# Diego Diaz
# the tapply function
library(reshape2)
library(ggplot2)
rdata <- read.csv("C://Users/Diego/Documents/R/iris.csv")


ggplot(rdata, aes(x = petallength, color = class, fill = class)) + geom_density(adjust = 0.5, alpha = 0.5) + xlim(0,8)

# Histograms
ggplot(rdata, aes(x = petallength, color = class, fill = class)) + geom_histogram(alpha = 0.5) + xlim(0,8)

# Frequency polygons
ggplot(rdata, aes(x = petallength, color = class, fill = class)) + geom_freqpoly(alpha = 0.5) + xlim(0,8)

# Histograms and frequency polygons can be plotted together!
ggplot(rdata, aes(x = petallength, color = class, fill = class)) + geom_freqpoly(alpha = 0.5) + xlim(0,8) + geom_histogram(alpha = 0.5)


ndata = melt(rdata)
dim(ndata)

ggplot(ndata, aes(x = value, color = class, fill = class)) + geom_density(adjust = 0.5, alpha = 0.5) + xlim(0,8) +
    facet_grid(variable ~ .)

ggplot(ndata, aes(x = value, color = class, fill = class)) + geom_density(adjust = 0.5, alpha = 0.5) + xlim(0,8) +
    facet_grid(. ~ variable)

# The granularity of the histogram can be adjusted by passing a value for the binwidth parameter to geom_histogram.
ggplot(ndata, aes(x = value, color = class, fill = class)) + geom_histogram(binwidth = 0.4, alpha = 0.5) + xlim(0,8) +
    facet_grid(. ~ variable)

ggplot(ndata, aes(x = value, color = class, fill = class)) + geom_histogram(alpha = 0.5) + xlim(0,8) +
    facet_grid(. ~ variable)


ggplot(ndata, aes(y = value, x =class, colour = class)) + geom_boxplot() + facet_grid(. ~ variable)

# Plots based on two attributes.
# two-dimensional kernel-density estimates can be plotted using the geom_density2d() function.
ggplot(rdata, aes(x = petallength, y = petalwidth)) + geom_density2d() + xlim(-0.5, 7.5) + ylim(-0.5, 3)

# This gives a contour plot in which the fill color is based on the value of the density function. It also provides a nice legend. 
ggplot(rdata, aes(x = petallength, y = petalwidth)) + stat_density2d(aes(fill =..level..))

# Separate plot for each class value.
ggplot(rdata, aes(x = petallength, y = petalwidth)) + stat_density2d(aes(fill =..level..)) + facet_grid(class ~ .)


# Separate plot for each class value +  logarithmic transformation.
ggplot(rdata, aes(x = petallength, y = petalwidth)) + stat_density2d(aes(fill =..level..)) + facet_grid(class ~ .) + scale_fill_gradient(trans = "log")

# Add scatter plots to the density estimates
ggplot(rdata, aes(x = petallength, y = petalwidth)) + stat_density2d(aes(fill =..level..)) + facet_grid(class ~ .) + geom_point()


                                                                     