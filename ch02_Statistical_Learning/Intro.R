        ### vectors, data, matrices, subsetting

x=c(2,7,5)
x
# [1] 2 7 5

y=seq(from=4,length=3,by=3)
?seq

y
# [1]  4  7 10

x+y
# [1]  6 14 15

x/y
# [1] 0.5 1.0 0.5

x^y
# [1]      16  823543 9765625

# subsetting with 1-indexing
x[2]
# [1] 7

x[2:3]
# [1] 7 5

x[-2]
# [1] 2 5

x[-c(1,2)]
# [1] 5

z = matrix(seq(1,12),4,3)
z
#      [,1] [,2] [,3]
# [1,]    1    5    9
# [2,]    2    6   10
# [3,]    3    7   11
# [4,]    4    8   12

z[3:4,2:3]
#      [,1] [,2]
# [1,]    7   11
# [2,]    8   12

z[,2:3]
#      [,1] [,2]
# [1,]    5    9
# [2,]    6   10
# [3,]    7   11
# [4,]    8   12

# returns vector
z[,1]
# [1] 1 2 3 4

# retain matrix
z[,1, drop=FALSE]
#      [,1]
# [1,]    1
# [2,]    2
# [3,]    3
# [4,]    4

dim(z)
# [1] 4 3

ls()
# [1] "x" "y" "z"

rm(y)
ls()
# [1] "x" "z"


        ### Generating random data, graphics

x = runif(50)   # random uniform
y = rnorm(50)   # random norm

plot(x,y)
plot(x,y,xlab="Random Uniform",ylab="Random Normal",pch="*",col="blue")

par(mfrow=c(2,1))   # panel of plots, 2 rows & 1 column
plot(x,y)
hist(y)

# panel will stay in place until reset
par(mfrow=c(1,1))


        ### [writing then] Reading in Data

Auto = read.csv("../data_sets/Auto.csv")
names(Auto)    # review colnames

dim(Auto)
# [1] 397  9

class(Auto)
# [1] "data.frame"

summary(Auto)
#      mpg          cylinders      displacement     horsepower      weight      acceleration        year      
# Min.   : 9.00   Min.   :3.000   Min.   : 68.0   150    : 22   Min.   :1613   Min.   : 8.00   Min.   :70.00  
# 1st Qu.:17.50   1st Qu.:4.000   1st Qu.:104.0   90     : 20   1st Qu.:2223   1st Qu.:13.80   1st Qu.:73.00  
# Median :23.00   Median :4.000   Median :146.0   88     : 19   Median :2800   Median :15.50   Median :76.00  
# Mean   :23.52   Mean   :5.458   Mean   :193.5   110    : 18   Mean   :2970   Mean   :15.56   Mean   :75.99  
# 3rd Qu.:29.00   3rd Qu.:8.000   3rd Qu.:262.0   100    : 17   3rd Qu.:3609   3rd Qu.:17.10   3rd Qu.:79.00  
# Max.   :46.60   Max.   :8.000   Max.   :455.0   75     : 14   Max.   :5140   Max.   :24.80   Max.   :82.00  
#                                                 (Other):287 

plot(Auto$cylinders,Auto$mpg)

attach(Auto)
search()    # you can see that "Auto" is added to our environment
# [1] ".GlobalEnv"        "Auto"              "package:ISLR"      "package:dplyr"     "package:tidyr"     "package:swirl"

plot(cylinders,mpg)     # plot more directly
boxplot(mpg~cylinders, xlab="Number of Cylinders", ylab="Miles Per Gallon")
