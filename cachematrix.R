## This code will cache the inverse of a matrix. 
## This code has 2 functions working together

## The makeCacheMatrix function takes a matrix as an argument. 
## It stores the matrix and its inverse in the function environment as cache. 
## It will return a list of functions which will allow for setting and getting
## the matrix and its inverse in the cache. 

makeCacheMatrix <- function(x = matrix()) {

        i <- NULL
        set <- function(y){
                x <<- y
                i <<- NULL
        }
        
        get <- function (){
                x
        }
        
        setInverse <- function (inverse){
                
                i <<- inverse
        }
        
        getInverse <- function (){
                
                i
        }
        
        list(set=set, get=get, setInverse=setInverse, getInverse=getInverse)
        
}


## The cacheSolve function takes the list of functions 
## returned from makeCacheMatrix function as an argument. 
## cacheSolve will check the inverse value in the cache in 
## the makeCacheMatrix function environment.   
## If the inverse is not NULL, cacheSolve will retrieve the value from the cache.  
## If the inverse is NULL, cacheSolve will compute the inverse and 
## store the inverse in the cache.

cacheSolve <- function(x, ...) {
        
        i <- x$getInverse()
        
        if (!is.null(i)) {
                message("getting cached data")
                return(i)
        }
        
        data <- x$get()
        
        i <- solve(data)
        
        x$setInverse(i)
        
        i
        
        
}


