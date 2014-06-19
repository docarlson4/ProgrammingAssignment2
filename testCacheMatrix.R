cat("\014")

rm(list = ls(all = TRUE))

setwd("~/MOOCS/Coursera/R Programming/Prog Assign 2")


source("cachematrix.R")

# Row/Column dimension of matrix
numRC = 2

# Create random vector and generate symmetric matrix
x <- rnorm(numRC * numRC)
xMat <- matrix(x, numRC, numRC)
xMat <- xMat %*% t(xMat)

# Clear x
rm(x)

# Test inverse
invXMat <- solve(xMat)
d = xMat %*% invXMat

# Begin project check
mkMat <- makeCacheMatrix(xMat)

cacheSolve(mkMat)

mkMat$getInverse()
