## This function creates an object that stores a numeric matrix and cache's its 
## inverse.The first function, makeCacheMatrix creates a matrix, which is
## really a list containing functions to
## 
##   1. set the value of the matrix
##   2. get the value of the matrix
##   3. set the value of the inverse
##   4. get the value of the inverse


makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  
  #   1. set the value of the matrix
  set <- function(y) {
    x <<- y
    m <<- NULL
  }

  #   2. get the value of the matrix
  get <- function() x

  #   3. set the value of the inverse
  setInverse <- function(solve) m <<- solve

  #   4. get the value of the inverse
  getInverse <- function() m
  
  # List of member functions
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
  
}


## This function calculates the inverse of a matrix object created with the
## above function. However, it first checks to see if the inverse has already
## been calculated. If so, it gets the inverse from the cache and skips the 
## computation. Otherwise, it calculates the inverse of the matrix and sets the
## value of the inverse in the cache via the setInverse function.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  
  ## Retrieve matrix inverse if it exists
  m <- x$getInverse()
  if(!is.null(m)) {
    message("getting cached matrix inverse")
    return(m)
  }
  
  ## In case inverse is null, create it
  data <- x$get()
  m <- solve(data, ...)
  x$setInverse(m)
  m
  
}
