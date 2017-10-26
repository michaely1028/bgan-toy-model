# bgan-toy-model
MATLAB.

Too lazy (or busy) to add comments about the samping.
 
## Question 1: Dynamic properties for GAN on a toy model ##

Just talk about the plot.

Blue dots: sample from the 2d Gaussian distribution with mu=0, cov=[10,0;0,1], combined by a rotation of 45$^{\circ}$.

Magenta solid point: Initialization for $g$. [-6,6].

Red dots: Start from the initial point, each time we take stochastic gradient descent for optimization. (Detailed omitted. Too long.) after fixed number of iteration for optimization, we get one of these red points. Do this for many times.

Yellow line: Trajectory for one optimization process, taking SGD. The final point is shown in black.

Purple line: Trajectory for one optimization process, taking GD. The final point is shown in magenta.

Problem remaining: 1- complicated $f$. 2- SGHMC. 

3- how to find the joint distribution . 
