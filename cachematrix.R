## Put comments here that give an overall description of what your
## functions do

## makeCacheMatrix creates a list containing a function to:
## Set the value of the vector, get the value of the vector, 
## Set the value of the inverse matrix and get the value of the inverse matrix.

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinv <- function(inv) m <<- inv
        getinv <- function() m
        list(set = set, get = get,
             setinv = setinv,
             getinv = setinv)
                
}

## cacheSolve calculates the value of the inverse matrix created with the above function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinv()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- inv(data, ...)
        x$setinv(m)
        m

}
