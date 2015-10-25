## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## makes a list which constains a function to set the value of the vector, get the value
## set the value of the inverse then gets the value

makeCacheMatrix <- function(x = matrix()) {
	m<-NULL
	set <-function(y) {
		x<<-y
		m<<-NULL
	}
	get<- function() x
	setinverse<-function(solve) m <<-solve
	getinverse<-function() m
	list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## Write a short comment describing this function
## Looks to pull the cached value if there is one from above function
## skips computation if already done otherwise solves for inverse

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	m<- x$getinverse()
	if(!is.null(m)){
		message("getting cached data")
		return(m)
	}
	data<-x$get()
	m<-solve(data,...)
	x$setinverse(m)
	m
}
