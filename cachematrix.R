## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
# The first function, makeCacheMatrix creates a special "matrix", which is really a list containing a function to 
# 1) set the value of matrix
# 2) get the elements in the matrix
# 3) set the value of inverse
# 4) get the value of inverse

makeCacheMatrix <- function(x = matrix()) {

          # holds the cached value or NULL if nothing is cached  
          # initially nothing is cached so set it to NULL  
       cache <- NULL  
         
       setmatrix <- function(newValue) {             # store a matrix 
               x <<- newValue  
               cache <<- NULL                        # since the matrix is assigned a new value, flush the cache  
        }  
       
        getmatrix <- function() {                    # returns the stored matrix 
                 x  
         }  
   
                                                      
        setinverse <- function(solve) {              # cache the given argument       
                 cache <<- solve  
        }  
          
       getinverse <- function() {                    # get the inverse value  
                 cache  
        }  
         
         list(setmatrix = setmatrix, getmatrix = getmatrix, setinverse = setinverse, getinverse = getinverse) # return a list. Each named element of the list is a function  
  
}


## Write a short comment describing this function
# The following function calculates the inverse of the special "matrix" created with the above function. 
# It first checks to see if the inverse has already been calculated. If so, it gets the inverse from the cache and skips the computation.
# Else it calculates the inverse of the matrix and sets the value of the inverse in the cache via the setinversefunction.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
         
        inverse <- x$getinverse()                      # get the cached value
  
        if(!is.null(inverse)) {                        # if a cached value exists return it 
                 message("getting cached data")  
                 return(inverse)  
         }  
       
         data <- x$getmatrix()                        # otherwise get the matrix, caclulate the inverse and store it in  
                                                      # the cache
          inverse <- solve(data)  
        x$setinverse(inverse)  
         inverse
}
