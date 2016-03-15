```
>> pkg list        # check loaded packages
Package Name  | Version | Installation directory
--------------+---------+-----------------------
   dataframe  |   1.1.0 | C:\Octave\Octave-4.0.0\share\octave\packages\dataframe-1.1.0
          io  |   2.4.0 | C:\Octave\Octave-4.0.0\share\octave\packages\io-2.4.0
       optim  |   1.5.0 | C:\Octave\Octave-4.0.0\share\octave\packages\optim-1.5.0
  statistics  |   1.2.4 | C:\Octave\Octave-4.0.0\share\octave\packages\statistics-1.2.4
      struct  |  1.0.12 | C:\Octave\Octave-4.0.0\share\octave\packages\struct-1.0.12
>> pkg load io
>> pkg list        # confirm pkg loaded (look for '*')
Package Name  | Version | Installation directory
--------------+---------+-----------------------
   dataframe  |   1.1.0 | C:\Octave\Octave-4.0.0\share\octave\packages\dataframe-1.1.0
          io *|   2.4.0 | C:\Octave\Octave-4.0.0\share\octave\packages\io-2.4.0
       optim  |   1.5.0 | C:\Octave\Octave-4.0.0\share\octave\packages\optim-1.5.0
  statistics  |   1.2.4 | C:\Octave\Octave-4.0.0\share\octave\packages\statistics-1.2.4
      struct  |  1.0.12 | C:\Octave\Octave-4.0.0\share\octave\packages\struct-1.0.12
```
### Boston dim & headers inspection
```
>> Boston_temp = csv2cell("../data_sets/Boston.csv", ",");
>> size(Boston_temp)
ans =
   507    14
>> names = Boston_temp(1,:)
names =
{
  [1,1] = crim
  [1,2] = zn
  [1,3] = indus
  [1,4] = chas
  [1,5] = nox
  [1,6] = rm
  [1,7] = age
  [1,8] = dis
  [1,9] = rad
  [1,10] = tax
  [1,11] = ptratio
  [1,12] = black
  [1,13] = lstat
  [1,14] = medv
}
```
### Boston matrix
```
>> Boston = dlmread("../data_sets/Boston.csv", ",", [1,0,507,14]);
### assign variables
>> medv = Boston(:,14);
>> lstat = Boston(:,13);
### plot
>> plot(lstat,medv, 'b.');
>> xlabel('lstat');
>> ylabel('medv');
>> xlim([-5,40]);
>> ylim([0,60]);
>> grid;
>> saveas (1, "plots/octplot1_scatter.png");
>> pause;        # using pause to generate later plot
```
### fit1 - linear regression
```
>>   # http://www.lauradhamilton.com/tutorial-linear-regression-with-octave
>> m = length(lstat);            # length of data points
>> X = [ones(m,1) lstat];       # multi-column matrix
>> y = Boston(:,14);             # assigning medv to 'y'
>> theta = (pinv(X'*X))*X'*y     # calculate theta
theta =
   34.55384
   -0.95005
### plot fitted regression
>> hold on;                      # keep previous plot
>> plot(X(:,2), X*theta, 'r-')
>> title('Housing Values in Suburbs of Boston')
>> legend('data points', 'lm')
>> hold off
>> saveas (1, "plots/octplot2_lm.png");
```
### fit1 - LinearRegression - forge
```
>>   # 95% confidence interval
>>   # http://octave.sourceforge.net/optim/function/LinearRegression.html
>>   # optim
>> pkg load optim;
>> x = Boston(:,13);             # assigning lstat to 'x'
>> y = Boston(:,14);             # assigning medv to 'y'
>> n = length(x);
>> F = [ones(n,1) x];
>> [p,e_var,r,p_var,y_var] = LinearRegression(F,y);
>> yFit = F*p;
>> figure()
>> plot(x,y,'+b',x,yFit,'-g',x,yFit+1.96*sqrt(y_var),'--r',x,yFit-1.96*sqrt(y_var),'--r')
>> title('Housing Values in Suburbs of Boston')
>> legend('data','fit','+/-95%')
>> xlabel('lstat');
>> ylabel('medv');
>> xlim([-5,40]);
>> ylim([0,60]);
>> grid on
>> saveas (1, "plots/octplot3_lm95.png");
### fitted residuals
>> fitted = yFit;
>> resid = y .- yFit;
>> plot(fitted, resid, '.k', fitted, fitted.*0, '-r');
>> title('Residual v. Fitted');
### legend('fit/resid');
>> xlabel('Fitted');
>> ylabel('Residual');
>> xlim([-5,40]);
>> ylim([-20,30]);
>> grid on
>> saveas (1, "plots/octplot4_resid.png");
```
### fit2 - multiple linear regression
```
>> lstat = Boston(:,13);
>> age = Boston(:,7);
>> F = [ones(506,1) lstat age];  # create matrix
>> y = Boston(:,14);             # target
>> [p,e_var,r,p_var,y_var] = LinearRegression(F,y);
### parameter coef
>> p
p =
   33.222761
   -1.032069
    0.034544
```
### fit5 - medv~lstat*age
```
>> lstat = Boston(:,13);
>> age = Boston(:,7);
>> F = [ones(506,1) lstat age lstat.*age];
>> y = Boston(:,14);             # target
>> [p,e_var,r,p_var,y_var] = LinearRegression(F,y);
### parameter coef
>> p
p =
  3.6089e+001
  -1.3921e+000
  -7.2086e-004
  4.1560e-003
###MSE
>> yFit = F*p;
>> sum((yFit .- y).^2)/506
ans =  37.505
```
### fit6 & 7 - nonlinear fit
```
>>   # p = polyfit (x, y, n)
>> x = Boston(:,13);             # assigning lstat to 'x'
>> y = Boston(:,14);             # assigning medv to 'y'
>> [p2,s2] = polyfit(x, y, 2);
>> [p4,s4] = polyfit(x, y, 4);
>> plot(x,y,'.g',x,s2.yf,'.r',x,s4.yf,'.b')
>> title('Housing Values in Suburbs of Boston');
>> legend('data','n = 2','n = 4');
>> xlabel('lstat');
>> ylabel('medv');
>> xlim([-5,40]);
>> ylim([0,60]);
>> grid on
>> saveas (1, "plots/octplot5_poly.png");
```
