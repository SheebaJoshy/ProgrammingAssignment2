## The code in this file will help to calculate the inverse of matrix object

## makCacheMatrix() creates a special list object which links to the 
## environments of four functions. 
## set() sets the matrix, get() gets the matrix
## set_inverse() sets/caches the inverse of the matrix 
## get_inverse() gets the inverse matrix if it is cached or returns NULL

    makeCacheMatrix <- function(x = matrix()) {
      m <- NULL
      set <- function(y) {
        x <<- y
        m <<- NULL
      }
      get <- function() x
      set_inverse <- function(solve) m <<- solve
      get_inverse <- function() m
      list(set = set, get = get,
           set_inverse = set_inverse,
           get_inverse = get_inverse)
      
    }


## cacheSolve() returns the inverse of a matrix using the list object 
## returned by makeCacheMatrix()

    cacheSolve <- function(x, ...) {
            ## Checks whether the inverse matrix is cached 
      m <- x$get_inverse()
      if(!is.null(m)){
        message ("getting cached data")
        return(m)
      }
           ## If inverse matrix is not cached the x is fetched using get() and 
           ## inverse is calculated using solve(x) and it is set for caching
      data <- x$get()
      #data<-as.matrix(data)
      m <- solve(data)
      x$set_inverse(m)
      m
    }
