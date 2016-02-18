require(ISLR)
require(boot)
?cv.glm

require(ggplot2)

plot(mpg~horsepower,data = Auto)
dev.copy(png,'./plots/Rplot1_scatter.png'); dev.off()
## ggplot version
ggplot(Auto, aes(horsepower,mpg)) +
    geom_point(alpha=.4,color='darkgreen',size=3) + 
    theme_bw()
ggsave('./plots/ggplot1_scatter.png',width=10,height=10)


## LOOCV (leave one out cross validation)
glm.fit=glm(mpg~horsepower, data = Auto)
cv.glm(Auto, glm.fit)$delta

# delta - A vector of length two. 
#   The first component is the raw cross-validation estimate of prediction error. 
#   The second component is the adjusted cross-validation estimate. 
#   The adjustment is designed to compensate for the bias introduced by not using 
#   leave-one-out cross-validation.

## write function to use formula (5.2)
loocv = function(fit){
    h = lm.influence(fit)$h
    mean((residuals(fit)/(1-h))^2)
}

## try function
loocv(glm.fit)

## test different polynomial fits
cv.error=rep(0,5)
degree=1:5
for(d in degree){
    glm.fit=glm(mpg~poly(horsepower, d), data = Auto)
    cv.error[d] = loocv(glm.fit)
}

## plot LOOCV error curve
plot(degree, cv.error, type = 'o')
dev.copy(png,'./plots/Rplot2_loocv_err_curve.png'); dev.off()

## ggplot version of polynomial lines
## add'l source: http://www.ats.ucla.edu/STAT/r/faq/smooths.htm
ggplot(Auto, aes(horsepower,mpg)) +
    geom_point(alpha=.6,color='gray',size=3) + 
    geom_smooth(method='lm',formula=y~x,se=F,size=1,color='black') + 
    geom_smooth(method='lm',formula=y~poly(x,2),se=F,size=1,color='blue') +
    geom_smooth(method='lm',formula=y~poly(x,3),se=F,size=1,color='red') + 
    geom_smooth(method='lm',formula=y~poly(x,4),se=F,size=1,color='green') + 
    geom_smooth(method='lm',formula=y~poly(x,5),se=F,size=1,color='violet') +
    theme_bw()
ggsave('./plots/ggplot2_poly_lines.png',width=10,height=10)

## 10-fold CV

cv.error10=rep(0,5)
for(d in degree){
    glm.fit=glm(mpg~poly(horsepower,d),data=Auto)
    cv.error10[d]=cv.glm(Auto,glm.fit,K=10)$delta[1]
}

## plot 10-fold CV error curve
lines(degree, cv.error10, type = 'o', col = 'red')
dev.copy(png,'./plots/Rplot3_loocv_v_10fold.png'); dev.off()


## Bootstrap
## formula 5.6

alpha = function(x,y) {
    vx = var(x)
    vy = var(y)
    cxy = cov(x,y)
    (vy - cxy)/(vx + vy - 2*cxy)
}

alpha(Portfolio$X,Portfolio$Y)

## standard error of alpha

alpha.fn = function(data, index) {
    with(data[index,],alpha(X,Y))
}

alpha.fn(Portfolio,1:100)

set.seed(1)
alpha.fn(Portfolio,sample(1:100,100,replace=T))

?boot
boot.out=boot(Portfolio,alpha.fn,R=1000)
boot.out
plot(boot.out)
dev.copy(png,'./plots/Rplot4_bootstrap_std_err.png'); dev.off()

## bootstrap plotting examples
## figure 5.9
par(mfrow=c(2,2))
for(d in 1:4){
    idx = sample(1:100,100,replace=T)
    plot(Portfolio[idx,], 
         main = paste('alpha std err: ', substr(as.character(alpha.fn(Portfolio, idx)),1,4)),
         col = 'green', type = 'p', pch = 19)
}
dev.copy(png,'./plots/Rplot5_bootstrap_std_err.png'); dev.off()
par(mfrow=c(1,1))
