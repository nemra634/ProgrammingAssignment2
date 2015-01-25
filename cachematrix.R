## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## Creates a cached matrix, cached inverse value and cached flag whether it's been changed or not. 
## Provides function to interact with the cached matrix and flags
## cx variable is a cached matrix, inv variable is a cached inverse value, hasBeenChanged is a cached value for the flag
## the corresponding functions are : getMatrix(),setInverse(inverse),getInverse
## there are also function that populate the cached matrix, which are set(value,rowInde,colIndex) and get(rowIndex,colIndex)
## a list of described functions is returned.
## Note : hasBeenChanged flag is initially has value TRUE, in this case that's because there is no calculation for the cached
## inverse, so it needs to bee calculated.
makeCacheMatrix <- function(x = matrix()) {      
      hasBeenChanged <- TRUE
      inv <- NULL
      cx <<- x
      
      set <- function(val,i,j){
            cx[i,j] <<- val
            hasBeenChanged <<- TRUE
      }
      
      getMatrix <- function()cx
      
      get <- function(i,j){
            cx[i,j]
      }
      
      getInverse <- function()inv
      
      setInverse <- function(inverse){
           inv <<- inverse
           hasBeenChanged <<- NULL
      }
      
      getHasBeenChanged <- function()hasBeenChanged
      
      list(set = set, get=get,getInverse = getInverse,setInverse = setInverse,getHasBeenChanged=getHasBeenChanged,getMatrix=getMatrix)
}


## Write a short comment describing this function
## This function gets a cached matrix object, checks wether it's been changed or not and does the following :
## if the value of the flag is TRUE then it calculates the inverse and stores in the cache and set the flag to NULL
## if the value is NULL this means that it's not been changed so it returns the cached inverse value
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
       
        if(!is.null(x$getHasBeenChanged())){
            x$setInverse(solve(x$getMatrix()))
            
        }
                
        x$getInverse()
}
