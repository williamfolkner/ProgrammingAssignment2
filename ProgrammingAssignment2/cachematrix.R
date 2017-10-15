## Just changed the function

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x) {
  
  m <- NULL
  
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  
  get <- function() x
  
  setinverse <- function(solve) m <<- solve 
  
  getinverse <- function() m
  
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
  
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}


## Check

x <- makeCacheMatrix(matrix(c(1,3,7,6,5,2,8,1,4), nrow=3, ncol=3))

cacheSolve(x)                     
                     
                     
              
                     