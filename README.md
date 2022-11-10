# Betrand's Paradox

The Bertrand paradox is generally presented as follows:

> Consider an equilateral triangle inscribed in a circle. Suppose a chord of the circle is chosen at random. What is the probability $p$ that the chord is longer than a side of the triangle?

![](plot.png)

Three different solutions are presented, each hinging on the method of generating the random chord:

-   **METHOD A (random endpoints)**: Choose two random points on the circumference of the circle, and draw the chord joining them.

![Visual using method 1](betrand%20paradox%20method%201.jpg){width="600"}

By choosing the starting point of a chord such as the corner of the triangle, the other endpoint of the chord will decide whether the chord is going to be longer or shorter than the edge of the triangle. Chord 1 has its endpoint touching the circumference of the arc between the two far corners of the triangle which make the chord longer than the side of the traingle. However, chords 2 and 3 have their endpoints on the circumference between the start point and the far corners, and it can be seen that these are shorter than the triangle sides.

![Chords chosen at random using method 1](method%201%20chords.gif){width="601"}

The Blue lines indicates that the chord are longer than the triangle sides and Black lines indicates that the chord is shorter than the triangle sides.

![Midpoints of the chords chosen at random and the probability using method 1.](method%201%20plot.gif){width="601"}

Blue dots indicate the midpoint of the chord that are longer than the triangle side and the black dots indicate the midpoint of chord that are shorter than the triangle side. Most of the long chords are concentrated at the center of the circle.

-   **METHOD B (random radial points)**: Choose a random radius of the circle, and a random point on this radius, and draw the chord through this point and perpendicular to the radius.

![Visual using method 2](betrands%20paradox%20method%202.jpg){width="594"}

Method 2 is define by constructing a perpendicular chord through the radius.If the chord crosses the radius closer to the circle's center than the triangle's sides (as in chord 1), it is longer than the triangle's sides; if it crosses the radius closer to the circle's edge (as in chord 2), it is shorter.

![Chords chosen at random using method 2](method%202%20chords.gif){width="601"}

The Blue lines indicates that the chord are longer than the triangle sides and Black lines indicates that the chord is shorter than the triangle sides.

![Midpoints of the chords chosen at random and the probability using method 2](method%202%20plot.gif){width="601"}

Blue dots indicate the midpoint of the chord that are longer than the triangle side and the black dots indicate the midpoint of chord that are shorter than the triangle side. Most of the long chords are concentrated at the center of the circle.

-   **METHOD C (random midpoints)**: Choose a point anywhere within the circle, and construct the chord such that the point chosen is the midpoint of the chord.

The three different methods above, all seemingly valid, yield different results for the probability in question! The exact answer can be worked out using geometric reasoning, but the goal of this assignment is to provide a visual and empirical way of calculating the probabilities.

## Instructions

> Objective: Show, using simulation and appropriate visualisations, that the three methods above yield different $p$ values.

As a group, you will write R code in a single .R script (named `solution.R`) that performs the intended solutions. This script should be able to be run without errors.

Consider the following points when writing your solutions:

-   You are free to choose the format of your solutions (`print()`, `cat()`, data frames, tibbles, ggplots, writing functions, etc.)--but note that marks are awarded for clarity.

-   Comment on your code to make its intention clearer (but don't go overboard!)

-   You may split the task among yourselves however you wish, as long as there is a proportional effort from all team members.

-   If you wish, you may present your solutions within GitHub (e.g. by appending a new section at the top of this README.md file and/or by using GitHub pages).

## Tips

This assignment assumes some basic knowledge of geometry and simple probability, including but not limited to

-   The equation of a circle with radius $r$ centred at $x_0$ and $y_0$ is given by $(x-x_0)^2 + (y-y_0)^2 = r^2$ (assuming a cartesian system of coordinates $(x,y)$ ).

-   Basic trigonometry angles such as $\sin \theta$ and $\cos \theta$ and Pythagoras theorem $a^2 + b^2 = c^2$.

-   Calculating distance between two points in 2-D space (Euclidean distance).

-   The principle of indifference: The probability $\Pr(A)$ of an event $A$ happening is given by the ratio of the number of favourable outcomes to the total number of outcomes in the sample space. That is, in a random experiment, suppose $n(S)$ denotes the total number of outcomes, and $n(A)$ denotes the number of outcomes involving $A$, then $$\Pr(A) = \frac{n(A)}{n(S)}.$$

In addition, you might find R's `runif()` function helpful for random number generation.
