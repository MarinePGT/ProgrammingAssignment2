### Coursera R programming
##Programming Assignment 2: Caching the Inverse of a Matrix
# ======================================================== 
# (21st October 2015)
# Author: M Pouget

## functions:
  # 1.makeCacheMatrix: fct creates "matrix" object that cache its inverse
  # 2.cacheSolve: fct computes inverse of the "matrix" returned by makeCacheMatrix 
    # If inverse already calculated (and matrix not changed), 
    # then cachesolve retrieves inverse from cache

# set working directory
setwd("C://Users/mpouget/Desktop/Coursera/assigment2")

### 1
makeCacheMatrix <- function(x = matrix()) {
  
  ## return: a list containing functions to
  ##              1. set the matrix
  ##              2. get the matrix
  ##              3. set the inverse
  ##              4. get the inverse
  
  inv <- NULL  
  setmatrix <- function(y) { 
    x <<- y 
    inv <<- NULL 
  }
  
  getmatrix = function() x
  setinverse = function(inverse) inv <<- inverse 
  getinverse = function() inv
 
  list(setmatrix = setmatrix, getmatrix = getmatrix, 
       setinverse = setinverse, getinverse = getinverse)
}

dump("makeCacheMatrix", file="makeCacheMatrix.R")

### 2
cacheSolve <- function (x=matrix(), ...) {
  ## return: inverse of the original matrix input to makeCacheMatrix()
  
   inv <- x$getinverse() 
  if(!is.null(inv)){ 
    message("getting cached data")
    return(inv)
  }
     
    y <- x$getmatrix() 
    inv <- solve(y, ...) 
    x$setinverse(inv) 
    inv
   
}
    

dump("cacheSolve",file="cacheSolve.R")


source("cachematrix.R")
source("cacheSolve.R")

