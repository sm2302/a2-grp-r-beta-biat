# Instruction to students: You may clear the code in this file and replace it
# with your own.

library(tidyverse)
library(ggforce)
theme_set(theme_void())

# Draw a random chord in a unit circle centred at origin -----------------------

# Coordinates of equilateral triangle
eqtri_df <- tibble(
  x    = c(0, sqrt(3) / 2, -sqrt(3) / 2),
  y    = c(1, -0.5, -0.5),
  xend = c(sqrt(3) / 2, -sqrt(3) / 2, 0),
  yend = c(-0.5, -0.5, 1)
)

# Coordinates of random chord
rdmchr_df <- tibble(
  x    = 0.93636368,
  y    = 0.35103142,
  xend = -0.9999991,
  yend = -0.001326758
)

# Plot
p <- ggplot() +
  ggforce::geom_circle(aes(x0 = 0, y0 = 0, r = 1), col = "gray50") +
  geom_segment(data = eqtri_df, aes(x = x, y = y, xend = xend, yend = yend)) +
  geom_segment(data = rdmchr_df, aes(x = x, y = y, xend = xend, yend = yend),
               col = "red3") +
  coord_equal()

ggsave(p, file = "plot.png", height = 5, width = 7)

################################################################################

# load library
library(ggplot2)
library(tidyverse)
library(gganimate)
library(plotly)

## assume circle with centre (0,0) and radius = 1

r <- 1    # length of radius
n <- 500  # number of chords generated 
m <- 1:n  # length of vector created

# length of side of a triangle
side_tr <- r*sqrt(3)

### method 1
# generate 2 random points on the circle
theta1_m1 <- runif(n, 0, 2*pi)
theta2_m1 <- runif(n, 0, 2*pi)

x1_m1 <- r*cos(theta1_m1)
y1_m1 <- r*sin(theta1_m1)

x2_m1 <- r*cos(theta2_m1)
y2_m1 <- r*sin(theta2_m1)

midx_m1 <- (x1_m1 + x2_m1)/2
midy_m1 <- (y1_m1 + y2_m1)/2

length_m1 <- sqrt((x1_m1 - x2_m1)^2 + (y1_m1 - y2_m1)^2)

# compare length
longer <- c()
for (i in length_m1){
  if (i >= side_tr){longer <- c(longer, 1)}
  else if (i < side_tr){longer <- c(longer, 0)}
}

# cumulative sum
long <- cumsum(longer)
long

# probability when each chord is added
prob <- long/m
prob

#----------------------------------------------------
df_m1 <- data.frame(x1_m1, y1_m1,
                    x2_m1, y2_m1,
                    midx_m1, midy_m1,
                    prob)

ggplot(df_m1, aes(midx_m1,midy_m1)) +
  geom_point() +
  transition_time(m) +
  shadow_mark() +
  labs(title = "Probability: {frame_time}")

plot_ly(
  x = c(x1_m1, x2_m1),
  y = c(y1_m1, y2_m1),
  type = "scatter",
  mode = "lines"
)

plot_ly(
  x = midx_m1,
  y = midy_m1,
  type = "scatter",
  mode = "markers"
)

#---------------------------------------------------

### method 2
# select a point on the radius and find the two end points

# let s be the length of a point chosen in a radius
# let alpha be the angle determining position of radius containing s
s <- runif(n, 0, r)
alpha <- runif(n, 0, 2*pi)

# refer calculation for the formula of x and y
C <- sqrt(r^2 - s^2)

x1_m2 <- s*cos(alpha) + C*sin(alpha)
y1_m2 <- s*sin(alpha) - C*cos(alpha)

x2_m2 <- s*cos(alpha) - C*sin(alpha)
y2_m2 <- s*sin(alpha) + C*cos(alpha)

midx_m2 <- (x1_m2 + x2_m2)/2
midy_m2 <- (y1_m2 + y2_m2)/2

length_m2 <- sqrt((x1_m2 - x2_m2)^2 + (y1_m2 - y2_m2)^2)
