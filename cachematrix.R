## A pair of functions that caches the inverse of a matrix


## Creates a special matrix object that can cache an inverse matrix

makeCacheMatrix <- function(x = matrix()){
        i <- NULL
        ## Set the matrix
        set <- funciton{
            m <<- matrix
            i <<- NULL
        }
        ## Get the matrix
        get <- function{
            m
        }
        ## Set the inverse of the matrix
        setInverse <- function(inverse){
            i <<- inverse
        }
        ## Get the inverse of the matrix
        getInverse <- function(){
            i
        }
        ## then,return a list of the methods
        list(set = set, get = get,
        setInverse = setInverse,
        getInverse = getInverse)

}


## Calculate the inverse of the specific matrix returned by "makeCacheMatrix" above

cacheSolve <- function(x, ...){
        ## Return a matrix that is the inverse of 'x'
        m <- x$getInverse()
        ## If it is already set, return the reverse
        if(!is.null(m)){
            message("get cached data")
            return(m)
        }
        ## Get the matrix
        data <- x$get()
        ## Calculate the inverse
        m <- solve(data) %*% data
        ## Set the inverse for the object
        x$setInverse(m)
        ## Return the matrix
        m
}
