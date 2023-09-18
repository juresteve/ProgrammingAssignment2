## These function calculate the inverse of a matrix and save it for
## retrieval once computed.

## This function returns a list with 4 other function to get the matrix 
## and its inverse in and out of cache.

makeCacheMatrix = function(X = matrix()){
        I = NULL
        set = function(Y) {
                X <<- Y
                I <<- NULL
        }
        get = function() X
        setinv = function(Inv) I <<- Inv
        getinv = function() I
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}



## This function tries to retrieve the inverse from cache.
## If there is no inverse to retrieve, it calculates it and saves in cache.

cacheSolve = function(X, ...) {
        I = X$getinv()
        if(!is.null(I)) {    ##Checking if the inverse is already computed in the cache.
                message("getting cached data")
                return(I)
        }
        Matrix = X$get()
        I = solve(Matrix, ...)
        X$setinv(I)
        I    ## Return a matrix that is the inverse of 'X'.
}

        

