## Task of 
## functions do
# First Git Test Version without commands

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    # Initialise inverse matrix buffer
	im <- NULL
	# 
	set <- function(y){  x <<- y ; im <<- NULL }
	get <- function() { x }
	setInverse <- function( invers ){ im <<- invers }
	getInverse <- function( ){ im }
	list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x,...){
    ## Return a matrix that is the inverse of 'x'
	if ( is.null(x$getInverse())){
		#print("calculate")
		x$setInverse( solve(x$get(),...))
	}
	x$getInverse()
}
