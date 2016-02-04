require(ISLR)
require(MASS)

### Linear Discriminant Analysis
lda.fit=lda(Direction~Lag1+Lag2,data=Smarket,subset=Year<2005)
lda.fit
# Call:
# lda(Direction ~ Lag1 + Lag2, data = Smarket, subset = Year < 
#     2005)
# 
# Prior probabilities of groups:
#     Down       Up 
# 0.491984 0.508016 
# 
# Group means:
#             Lag1        Lag2
# Down  0.04279022  0.03389409
# Up   -0.03954635 -0.03132544
# 
# Coefficients of linear discriminants:
#             LD1
# Lag1 -0.6420190
# Lag2 -0.5135293
plot(lda.fit)
dev.copy(png,'./plots/Rplot2_lda_hist.png'); dev.off()    # copy plot to local

# subset df
Smarket.2005=subset(Smarket,Year==2005)
lda.pred=predict(lda.fit,Smarket.2005)
lda.pred[1:5,]
# Error in lda.pred[1:5, ] : incorrect number of dimensions
class(lda.pred)
# [1] "list"
data.frame(lda.pred)[1:5,]
#      class posterior.Down posterior.Up         LD1
# 999     Up      0.4901792    0.5098208  0.08293096
# 1000    Up      0.4792185    0.5207815  0.59114102
# 1001    Up      0.4668185    0.5331815  1.16723063
# 1002    Up      0.4740011    0.5259989  0.83335022
# 1003    Up      0.4927877    0.5072123 -0.03792892
table(lda.pred$class,Smarket.2005$Direction)
#       
#        Down  Up
#   Down   35  35
#   Up     76 106
mean(lda.pred$class==Smarket.2005$Direction)
# [1] 0.5595238


### K-Nearest Neighbors (kNN)
library(class)
?class
?knn
# knn(train, test, cl, k = 1, l = 0, prob = FALSE, use.all = TRUE)
attach(Smarket)
ls()
# [1] "lda.fit"      "lda.pred"     "Smarket.2005"
objects(2)
# [1] "Direction" "Lag1"      "Lag2"      "Lag3"      "Lag4"      "Lag5"      "Today"     "Volume"    "Year"     

Xlag=cbind(Lag1,Lag2)
train=Year<2005
knn.predict=knn(Xlag[train,],Xlag[!train,],Direction[train],k=1)
# confusion matrix
table(knn.predict,Direction[!train])
#            
# knn.predict Down Up
#        Down   43 58
#        Up     68 83
# look at classification performance
mean(knn.predict==Direction[!train])
# [1] 0.5

# try more neighbors
knn.predict=knn(Xlag[train,],Xlag[!train,],Direction[train],k=2)
mean(knn.predict==Direction[!train])
# [1] 0.5039683

knn.predict=knn(Xlag[train,],Xlag[!train,],Direction[train],k=3)
mean(knn.predict==Direction[!train])
# [1] 0.531746

knn.predict=knn(Xlag[train,],Xlag[!train,],Direction[train],k=4)
mean(knn.predict==Direction[!train])
# [1] 0.5119048