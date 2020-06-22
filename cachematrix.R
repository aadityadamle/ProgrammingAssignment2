## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

  m <- NULL #Setting inverse to null
  set <- function(y) {
    x <<- y #Stores called matrix outside the current environment
    m <<- NULL #Resets inverse to null each time the called matrix is changed
  }
  get <- function() {x} # Returning the called matrix
  setinverse <- function(solve) {m <<- solve} # Storing the inverse outside the current environment
  getinverse <- function() {m} # Returning the Inverse that is already computed
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse() #Retrieving the inverse from list
  if(!is.null(m)) {
    message("getting cached data")
    return(m) # returns only if m is not null
  }
  data <- x$get() # if m is null then the called matrix is retrived from the list 
  m <- solve(data, ...) # Calculating inverse 
  x$setinverse(m) # Storing the value
  m # Returning value to user
}
