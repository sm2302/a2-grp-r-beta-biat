# load library
library(tidyverse)
library(ggforce)
library(gganimate)
library(gifski)

theme_set(theme_grey())

# Draw a circle with radius r centered at origin--------------------------------
r <- 1    # length of radius
n <- 500  # number of chords generated 
m <- 1:n  # length of vector created

# length of side of a triangle
side_tr <- r*sqrt(3)

#-------------------------------------------------------------------------------
### Method 1 ###
# choose two random points on the circumference of the circle-------------------
theta1 <- runif(n, 0, 2*pi)
theta2 <- runif(n, 0, 2*pi)

x1_m1 <- r*cos(theta1)
y1_m1 <- r*sin(theta1)

x2_m1 <- r*cos(theta2)
y2_m1 <- r*sin(theta2)

#midpoints
midx_m1 <- (x1_m1 + x2_m1)/2
midy_m1 <- (y1_m1 + y2_m1)/2

# length of the chord
length_m1 <- sqrt((x1_m1 - x2_m1)^2 + (y1_m1 - y2_m1)^2)

# compare length of the chord with side of the triangle
longer1 <- c()
for (i in length_m1){
  if (i >= side_tr){longer1 <- c(longer1, 1)}
  else if (i < side_tr){longer1 <- c(longer1, 0)}
}

# cumulative sum
long1 <- cumsum(longer1)

# probability when each chord is added
prob1 <- long1/m

# create a data frame for method 1
df_m1 <- tibble(m,
                x1_m1, y1_m1,
                x2_m1, y2_m1,
                midx_m1, midy_m1,
                longer1, prob1)


# plot for method 1
method1 <- ggplot() +
  ggforce::geom_circle(aes(x0 = 0, y0 = 0, r = r), col = "gray50") +
  geom_segment(data = df_m1, aes(x = x1_m1, 
                                 y = y1_m1,
                                 xend = x2_m1, 
                                 yend = y2_m1,
                                 col = longer1)) +
  theme(legend.position = "none") +
  coord_equal() + 
  transition_time(m) +
  shadow_mark() +
  labs(x = "x",
       y = "y",
       title = "Method 1",
       subtitle = " No of chords : {m[(frame_time)]}") 

animate(method1)

plot1 <- ggplot() +
  ggforce::geom_circle(aes(x0 = 0, y0 = 0, r = r), col = "gray50") +
  geom_point(data = df_m1, aes(x = midx_m1,
                               y = midy_m1, 
                               col = longer1)) +
  theme(legend.position = "none") +
  coord_equal() +
  transition_time(m) +
  shadow_mark() +
  labs(x = "x",
       y = "y",
       title = "Method 1",
       subtitle = "Probability : {prob1[frame_time]}")

animate(plot1)

#-------------------------------------------------------------------------------
### Method 2 ###
# select a point on the radius and find the two end points on the circle--------

# let *s* be the length of a point chosen in a radius
#let *alpha* be the angle determining the radius containing s
s <- runif(n, 0, r)
alpha <- runif(n, 0, 2*pi)

# refer calculation to find end points
C <- sqrt(r^2 - s^2)

x1_m2 <- s*cos(alpha) + C*sin(alpha)
y1_m2 <- s*sin(alpha) - C*cos(alpha)

x2_m2 <- s*cos(alpha) - C*sin(alpha)
y2_m2 <- s*sin(alpha) + C*cos(alpha)

midx_m2 <- (x1_m2 + x2_m2)/2
midy_m2 <- (y1_m2 + y2_m2)/2

length_m2 <- sqrt((x1_m2 - x2_m2)^2 + (y1_m2 - y2_m2)^2)

# compare length of the chord with side of the triangle
longer2 <- c()
for (i in length_m2){
  if (i >= side_tr){longer2 <- c(longer2, 1)}
  else if (i < side_tr){longer2 <- c(longer2, 0)}
}

# cumulative sum
long2 <- cumsum(longer2)

# probability when each chord is added
prob2 <- long2/m

# create data frame for method 2
df_m2 <- tibble(m,
                x1_m2, y1_m2,
                x2_m2, y2_m2,
                midx_m2, midy_m2,
                longer2, prob2)


# plot for method 2
method2 <- ggplot() +
  ggforce::geom_circle(aes(x0 = 0, y0 = 0, r = r), col = "gray50") +
  geom_segment(data = df_m2, aes(x = x1_m2, 
                                 y = y1_m2,
                                 xend = x2_m2, 
                                 yend = y2_m2,
                                 col = longer2)) +
  theme(legend.position = "none") +
  coord_equal() + 
  transition_time(m) +
  shadow_mark() +
  labs(x = "x",
       y = "y",
       title = "Method 2",
       subtitle = " No of chords : {m[(frame_time)]}") 

animate(method2)

plot2 <- ggplot() +
  ggforce::geom_circle(aes(x0 = 0, y0 = 0, r = r), col = "gray50") +
  geom_point(data = df_m2, aes(x = midx_m2,
                               y = midy_m2, 
                               col = longer2)) +
  theme(legend.position = "none") +
  coord_equal() +
  transition_time(m) +
  shadow_mark() +
  labs(x= "x",
       y = "y",
       title = "Method 2",
       subtitle = "Probability : {prob2[frame_time]}")

animate(plot2)

#-------------------------------------------------------------------------------
### Method 3 ###
# choose any random points inside a circle and find two endpoints---------------

# let *k* be the length of the point chosen at random in a circle
# let *gamma* be the angle determining the position of k
k <- sqrt(runif(n, 0, r^2))
gamma <- runif(n, 0, 2*pi)

# refer calculation to find end points
D <- sqrt(r^2 - k^2)

x1_m3 <- k*cos(gamma) + D*sin(gamma)
y1_m3 <- k*sin(gamma) - D*cos(gamma)

x2_m3 <- k*cos(gamma) - D*sin(gamma)
y2_m3 <- k*sin(gamma) + D*cos(gamma)

midx_m3 <- (x1_m3 + x2_m3)/2
midy_m3 <- (y1_m3 + y2_m3)/2

length_m3 <- sqrt((x1_m3 - x2_m3)^2 + (y1_m3 - y2_m3)^2)

# compare length of the chord with side of the triangle
longer3 <- c()
for (i in length_m3){
  if (i >= side_tr){longer3 <- c(longer3, 1)}
  else if (i < side_tr){longer3 <- c(longer3, 0)}
}

# cumulative sum
long3 <- cumsum(longer3)

# probability when each chord is added
prob3 <- long3/m

# create data frame for method 3
df_m3 <- tibble(m,
                x1_m3, y1_m3,
                x2_m3, y2_m3,
                midx_m3, midy_m3,
                longer3, prob3)


# plot for method 3
method3 <- ggplot() +
  ggforce::geom_circle(aes(x0 = 0, y0 = 0, r = r), col = "gray50") +
  geom_segment(data = df_m3, aes(x = x1_m3, 
                                 y = y1_m3,
                                 xend = x2_m3, 
                                 yend = y2_m3,
                                 col = longer3)) +
  theme(legend.position = "none") +
  coord_equal() + 
  transition_time(m) +
  shadow_mark() +
  labs(x = "x",
       y = "y",
       title = "Method 3",
       subtitle = " No of chords : {m[(frame_time)]}") 

animate(method3)

plot3 <- ggplot() +
  ggforce::geom_circle(aes(x0 = 0, y0 = 0, r = r), col = "gray50") +
  geom_point(data = df_m3, aes(x = midx_m3,
                               y = midy_m3, 
                               col = longer3)) +
  theme(legend.position = "none") +
  coord_equal() +
  transition_time(m) +
  shadow_mark() +
  labs(x = "x",
       y = "y",
       title = "Method 3",
       subtitle = "Probability : {prob3[frame_time]}")

animate(plot3)
#===============================================================================