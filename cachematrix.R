## R Programming Assignment 2
## Task: Caching the Inverse of a Matrix
## 
## The provided solution uses the function templates that are provided with the task. I
## used them even so I would have done it totally different, as this is an "insecure" and 
## not very user friendly way of doing it, as calculation and storage of the inversion are 
## separated, which mean that any thing can be set as invert matrix and a user of the 
## function needs to know that two functions are required to get a caching.
## I would have created an inner function "invert" within makeCacheMatrix, which implements
## the calculation and caching. 

## The following two functions shall enable a buffering of an inverse of a given matrix. 
## makeCacheMatrix stores a matrix and provides a get and set function as well as setInverse
## and getInverse to set and get the buffered inverse matrix 
makeCacheMatrix <- function(x = matrix()) {
    ## Initialise inverse matrix buffer
	im <- NULL
	## set and get the matrix
	set <- function(y){  x <<- y ; im <<- NULL }
	get <- function() { x }
	## set and get the invers matrix
	setInverse <- function( invers ){ im <<- invers }
	getInverse <- function( ){ im }
	
	list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}

## cacheSolve creates the inverse matrix of a matrix provided by parameter x.
## x has to be of type makeCacheMatrix. The calculation is only be done in 
## x doesn't have already stored an inverse matrix
cacheSolve <- function(x,...){
    ## Return a matrix that is the inverse of 'x'
	if ( is.null(x$getInverse())){
		#print("calculate")
		## To get the invert matrix using function solve it is 
		## necessary that parameter "b" has the value of the 
		## identity matrix, which is the case it it is not provided.
		## TTO ensure the the "..." parameter is not forwarded 
		x$setInverse( solve(x$get()))
	}
	x$getInverse()
}
