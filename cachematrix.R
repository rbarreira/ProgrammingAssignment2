 
# Example:
# A  <- matrix(c(1,2,3,4),nrow=2, ncol=2) // to create a 2x2 matrix A
# > cached <- makeCacheMatrix(A) // create cached matrix
# > cashed$get() // to return the cached matrix
# > cacheSolve(cached) // to return the inverse
# > cacheSolve(cached) // to check if the matrix is cached 

## This function creates a special matrix which is a list of the following  
## functions
## 1. set the matrix
## 2. get the matrix
## 3. set the inverse
## 4. get the inverse
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  # setter for the matrix
  set <- function(y) {
    x <<- y #assigns a value to x in an environment that is different from the current one
    m <<- NULL
  }
  #getter for the matrix
  get <- function() x
  
  #setter for the inverse
  setinverse <- function(inverse) m <<- inverse
  #getter for the inverse 
  getinverse <- function() m
  
  #returns the list of functions
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Returns the inverse of the matrix or the cached inverse if it already exists

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
# If the inverse has been already calculated, it returns the cached inverse
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
data <- x$get()
m <- solve(data, ...)
#to cache the inverse
x$setinverse(m)
m
}


