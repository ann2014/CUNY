# 
# R Bridge - Week 1 Assignment
# Please place your solution in a single file in your GitHub repository, and provide the URL in your assignment link. 
# 
# 1.	Write a loop that calculates 12-factorial. 

inPvec<-1 #predefine vector to concatenate results into
for (x in 1:12){ 
  # browser()
  if(x == 1) inPvec <- 1
  else {
    inPvec <- inPvec * x
  }
  cat(x, "!:", inPvec, "\n")
}

# Output:
#   1 !: 1 
# 2 !: 2 
# 3 !: 6 
# 4 !: 24 
# 5 !: 120 
# 6 !: 720 
# 7 !: 5040 
# 8 !: 40320 
# 9 !: 362880 
# 10 !: 3628800 
# 11 !: 39916800 
# 12 !: 479001600
# 
# Resource: http://stackoverflow.com/questions/18375370/return-value-from-function-when-iterating-in-a-loop-r
# 
# 2.	Show how to create a numeric vector that contains the sequence from 20 to 50 by 5. 

nVec <- seq(20, 50, by = 5)
is.vector(nVec, mode = "numeric")
# [1] TRUE

# 3.	Show how to take a trio of input numbers a, b, and c and implement the quadratic equation. 
# Using r to solve the below quadratic equation:  

QFun <- function(a, b, c) {
  numSqrt <- b^2 - 4*a*c
  if(numSqrt > 0) {
    x1 <- (-b+sqrt(b^2 - 4*a*c))/(2*a)
    x2 <- (-b-sqrt(b^2 - 4*a*c))/(2*a)
    x <- c(x1, x2)
    x
  } else if (numSqrt == 0) {
    x <- -b/(2*a)
    x
  } else {"No results when the number under square root less than 0."}
}

#Test with x^2???2*x+1=0
QFun(1, -2, 1)
# [1] 1


# Image resource: https://tothereal.wordpress.com/2013/05/06/why-is-it-that-students-always-seem-to-understand-but-then-never-remember/
