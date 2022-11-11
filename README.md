# Betrand's Paradox

The Bertrand paradox is generally presented as follows:

> Consider an equilateral triangle inscribed in a circle. Suppose a chord of the circle is chosen at random. What is the probability $p$ that the chord is longer than a side of the triangle?

![](plot.png)

Three different solutions are presented, each hinging on the method of generating the random chord:

-   **METHOD A (random endpoints)**: Choose two random points on the circumference of the circle, and draw the chord joining them.

![Visual using method 1](betrand%20paradox%20method%201.jpg)

(_Visual using method 1_)

By choosing the starting point of a chord such as the corner of the triangle, the other endpoint of the chord will decide whether the chord is going to be longer or shorter than the edge of the triangle. Chord 1 has its endpoint touching the circumference of the arc between the two far corners of the triangle which make the chord longer than the side of the traingle. However, chords 2 and 3 have their endpoints on the circumference between the start point and the far corners, and it can be seen that these are shorter than the triangle sides.

![Chords chosen at random using method 1](method%201%20chords.gif)

(_Chords chosen at random using method 1_)

The Blue lines indicates that the chord are longer than the triangle sides and Black lines indicates that the chord is shorter than the triangle sides.

![Midpoints of the chords chosen at random and the probability using method 1](method%201%20plot.gif)

(_Midpoints of the chords chosen at random and the probability using method 1_)

Blue dots indicate the midpoint of the chord that are longer than the triangle side and the black dots indicate the midpoint of chord that are shorter than the triangle side. Most of the long chords are concentrated at the center of the circle.

-   **METHOD B (random radial points)**: Choose a random radius of the circle, and a random point on this radius, and draw the chord through this point and perpendicular to the radius.

![Visual using method 2](betrands%20paradox%20method%202.jpg)

(_Visual using method 2_)

Method 2 is define by constructing a perpendicular chord through the radius.If the chord crosses the radius closer to the circle's center than the triangle's sides (as in chord 1), it is longer than the triangle's sides; if it crosses the radius closer to the circle's edge (as in chord 2), it is shorter.

![Chords chosen at random using method 2](method%202%20chords.gif)

(_Chords chosen at random using method 2_)

The Blue lines indicates that the chord are longer than the triangle sides and Black lines indicates that the chord is shorter than the triangle sides.

![Midpoints of the chords chosen at random and the probability using method 2](method%202%20plot.gif)

(_Midpoints of the chords chosen at random and the probability using method 2_)

Blue dots indicate the midpoint of the chord that are longer than the triangle side and the black dots indicate the midpoint of chord that are shorter than the triangle side. Most of the long chords are concentrated at the center of the circle.

-   **METHOD C (random midpoints)**: Choose a point anywhere within the circle, and construct the chord such that the point chosen is the midpoint of the chord.

![Visual using method 3](betrands%20paradox%20method%203.jpg)

(_Visual using method 3_)

For the third solution, imagine that the chord is defined by where its midpoint sits within the circle. In the diagram, there is a smaller circle inscribed within the triangle. It can be seen in the diagram that if the midpoint of the chord falls within this smaller circle, like Chord 1's does, then the chord is longer than the triangle's sides.

![Chords chosen at random using method 3](method%203%20chords.gif)

(_Chords chosen at random using method 3_)

Conversely, if the chord's centre lies outside of the smaller circle, then it is smaller than the triangle's sides. As the smaller circle has a radius 1/2 the size of the larger circle, it follows that it has 1/4 of the area. Therefore there is a probability of 1/4 that a random point lies within the smaller circle, hence a probability of 1/4 that the chord is longer than a triangle side.

![Midpoints of the chords chosen at random and the probability using method 3](method%203%20plot.gif)

(_Midpoints of the chords chosen at random and the probability using method 3_)

The three different methods above, all seemingly valid, yield different results for the probability in question! The exact answer can be worked out using geometric reasoning, but the goal of this assignment is to provide a visual and empirical way of calculating the probabilities.

