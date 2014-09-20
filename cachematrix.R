## Usage: If c is an invertible matrix, calling cacheSolve(makeCacheMatrix(c)) 
## returns the inverse of c.


## These functions are HEAVILY inspired by the example code provided

## Returns a list of functions that provide a cache for calculating the inverse of a matrix
makeCacheMatrix <- function(x = numeric()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    
    get <- function() x
    setsolve <- function(solve) m <<- solve
    getsolve <- function() m
    list (set = set, get = get, 
          setsolve = setsolve,
          getsolve = getsolve)
}


## Solve using the cache created by the makeCacheMatrix function

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    m <- x$getsolve()
    ## If the cache returns a value, no need to calculate it again
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    ## Get the matrix data from the cache
    data <- x$get()
    ## Calculate the inverse of the matrix
    m <- solve(data, ...)
    ## Save the inverse in the cache
    x$setsolve(m)
    ## Return the inverse
    m
}
