# Math 5110 Final Project 
# December 14, 2021
# Emma Coates, Ann Despain, Carson Miller

# Solves linear systems of differential equations given matrix 'A' and 
#  intial conditions inits 
solve_linear <- function(A, inits = c(1, 1), tmax = 50, n = 500) {
  # compute eigenvectors and eigenvalues
  eig <- eigen(A)
  E <- eig$vectors
  lambdas <- eig$values
  
  # solve for the initial conditon
  C <- solve(E) %*% inits
  
  # create time steps
  ts <- seq(0, tmax, length.out = n)
  x <- matrix(0, nrow = n, ncol = ncol(A))
  
  for (i in seq(n)) {
    t <- ts[i]
    x[i, ] <- E %*% (C * exp(lambdas * t))
  }
  
  # Re drops the imaginary part ... more on that later!
  Re(x)
}


library('fields')
# Plots a vector field given matrix 'A' and plot title
plot_vector_field <- function(A, title = '', ...) {
  x <- seq(-4, 4, .50)
  y <- seq(-4, 4, .50)
  
  RJ <- as.matrix(expand.grid(x, y))
  dRJ <- t(A %*% t(RJ))
  
  plot(
    x, y, type = 'n', axes = FALSE,
    xlab = '', ylab = '', main = title, cex.main = 1.5, ...
  )
  
  arrow.plot(
    RJ, dRJ,
    arrow.ex = .1, length = .05, lwd = 1.5, col = 'gray82'
  )
  
  text(3.9, -.2, 'R', cex = 1.25, font = 2)
  text(-.2, 3.9, 'J', cex = 1.25, font = 2)
  lines(c(-4, 4), c(0, 0), lwd = 1)
  lines(c(0, 0), c(4, -4), lwd = 1)
}


plot_eigenvectors <- function(A, ...) {
  E <- eigen(A)$vectors * 4
  arrows(-E[1, 1], -E[2, 1], E[1, 1], E[2, 1], length = 0, lty = 2, ...)
  arrows(-E[1, 2], -E[2, 2], E[1, 2], E[2, 2], length = 0, lty = 2, ...)
}

# Adds solution to existing vector field given matrix A and initial   
# conditions inits
add_line <- function(A, inits) {
  lines(solve_linear(A, inits = inits), col = 'red', lwd = 1.5)
}

# The following lines reproduce the figure "The Saddle of Love" 
A <- cbind(c(-2, -1), c(1, 2))
plot_vector_field(A, title = 'The Saddle of Love')
plot_eigenvectors(A)

add_line(A, c(3.5, 1))
add_line(A, c(3.5, .75))
add_line(A, -c(3.5, 1))
add_line(A, -c(3.5, .75))

points(0, 0, cex = 1.7)
points(0, 0, cex = 2.2, col = 'white', pch = 20)

# The following lines reproduce the figure "The Stable Spiral of Love"
A <- cbind(c(-0.20, -1), c(1, 0))
plot_vector_field(A, title = 'The Stable Spiral of Love')
add_line(A, c(2,2))

# The following lines reproduce the figure "Damped Oscillations"
plot(seq(1,500,by=1), solve_linear(A,c(2,2))[,1], type = 'l', col='red', 
      xlab="Time", ylab="Feelings", ylim=c(-3,3))
lines(seq(1,500,by=1), solve_linear(A,c(2,2))[,2], type = 'l', col='blue')
title("Damped Oscillations")
legend("topright", c("Romeo", "Juliet"), col=c("red","blue"), lty=c(1,1), 
       cex=0.75)

# The following lines reproduce the figure "The Unstable Spiral of love"
A <- cbind(c(0.10, -1), c(1,0))
plot_vector_field(A, title = 'The Unstable Sprial of Love')
add_line(A, c(0.1,0.1))

# The following lines reproduce the figure "Amplifying Oscillations" 
plot(seq(1,500,by=1), solve_linear(A,c(0.2,0.2))[,1], type = 'l', col='red', 
      xlab="Time", ylab="Feelings", ylim=c(0-6,6))
lines(seq(1,500,by=1), solve_linear(A,c(0.2,0.2))[,2], type = 'l',col='blue')
title("Amplifying Oscillations")
legend("topright", c("Romeo", "Juliet"), col=c("red","blue"), lty=c(1,1), 
        cex=0.75)


