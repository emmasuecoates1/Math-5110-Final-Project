# Final Project, Math 5110
This project exists to reproduce select figures from "Love Affairs and Differential Equations" using R, and serves as the final project for Math 5110 at the University of Utah. 
# Background
"Love Affairs and Differential Equations," a blog post inspired Strogatz, uses linear diferential equations to study love affairs between two people. A system of two linear differential equations represent the love affair between Romeo and Juliet, where Romeo's feelings for Juliet at time t are represented by R(t), and Juliet's feelings for Romeo at time t are represented by J(t). Romeo's differential equation contains a term representing how Romeo listens to his own feelings and a term representing how he repsonds to Juiet's feelings. Juliet's differential equation contains a term representing how Juliet listens to her own feelings and a term representing how she repsonds to Romeo's feelings. This system can be re-written in 2x2 matrix form, allowing this program to work smoothly. We reproduce three figures from the blog post:
1. "The Saddle of Love," a vector field with a saddle node and possible trajectories for when Romeo and Juliet communicate in opposite ways.
2. "The Stable Spiral of Love," a vector field with a stable spiral trajectory for when Romeo dampens his own feelings slightly and feels more love when Juliet hates him and more hate if Juliet loves him. "Amplifying Oscillations" is also produced with this figure, as it is simply the solution to the system over time.
3. "The Unstable Spiral of Love," a vector field with a stable spiral trajectory for when Romeo listens to his own feelings slightly and feels more love when Juliet hates him and more hate if Juliet loves him. "Damped Oscillations" is also produced with this figure, as it is simply the solution to the system over time.
# Programming Design 
The program consists of three functions that solves linear system and plots vector fields along with solutions: 
1. solve_linear(A, inits, tmax = 50, n =500): This function solves a linear system given a matrix, A, and intiial conditions, inits. It does so by solving for the eigenvalues and eigenvectors, and plugging those parameters into the general solution of a square system. Only the real part of the solution is extracted. 
2. plot_vector_field(A, title = '', ...): This function plots a vector field for a linear system give a matrix, A, and the desired title of the plot, title. 
3. plot_eigenvectors(A, ...): This function plots eigenvectors of a linear system given a matrix, A. This function is only used when plotting "The Saddle of Love."
4. add_line(A, inits): This function plots trajectories of a linear system give a matrix, A, and initial conditions, inits. 

Below the four functions, all figures are plotted using a combination of the functions. The code can be run as is, and all figures will be produced. 
