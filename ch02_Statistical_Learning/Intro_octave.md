## ISLR, Chapter 2 Octave Renditions
```

>> ### vector
>> x = [2, 7, 5]
x =
   2   7   5

>> ### vector w step
>> y = 4:3:12
y =
    4    7   10

>> ### addition
>> x + y
ans =
    6   14   15

>> ### division, element by element
>> x ./ y
ans =
   0.50000   1.00000   0.50000

>> ### exponent, element by element
>> x .^ y
ans =
        16    823543   9765625

>> ### indexing (1-indexed)
>> x(2)
ans =  7

>> x(2:end)
ans =
   7   5

>> x([1,3])
ans =
   2   5

>> x(![2])
ans = [](0x0)

>> ### matrix: range, reshape, & slice
>> z = reshape(1:12,4,3)
z =
    1    5    9
    2    6   10
    3    7   11
    4    8   12

>> z([3,4], [2,3])
ans =
    7   11
    8   12

>> z(:, [2:3])
ans =
    5    9
    6   10
    7   11
    8   12

>> z(:,1)    ### retains column/matrix form
ans =
   1
   2
   3
   4

>> size(z(:,1))
ans =
   4   1

>> ### list currently defined variables
>> who
Variables in the current scope:
ans   test  x     y     z

>> ### remove variables
>> clear y
>> who
Variables in the current scope:

ans   test  x     z

>> ### generating random data & plots
>> x = unifrnd(0,1,1,50)
>> y = stdnormal_rnd(1,50)

>> plot(x, y, 'or'); grid;
>> print -dpng plots/octplot1.png
```
![plot](plots/octplot1.png?raw=true "scatter")
```
>> plot(x, y, 'b+');
>> xlabel('Random Uniform');
>> ylabel('Random Normal');
>> grid
>> saveas (1, "plots/octplot2.png")
```
![plot](plots/octplot2.png?raw=true "scatter2")
```
>> subplot(2,1,1)
>> plot(x, y, '.r'); grid;
>> title('scatter plot');
>> xlabel('x');
>> ylabel('y');
>> subplot(2,1,2)
>> hist(y,10, 'r'); grid;
>> title('histogram of y');
>> ylabel('frequency');
>> saveas (1, "plots/octplot3.png")
```
![plot](plots/octplot3.png?raw=true "scatter & hist")
```
>> ### reading in data
>> ### http://octave.sourceforge.net/packages.php
>> pkg install -forge dataframe
>> ### warning: creating installation directory C:\Octave\Octave-4.0.0\share\octave\packages
>> pkg list
>> path    ### current load path
>> addpath('C:\Octave\Octave-4.0.0\share\octave\packages\dataframe-1.1.0')
>> pkg load dataframe
>> pkg list    # confirm pkg loaded (look for '*')
>> Auto = dataframe("../data_sets/Auto.csv")    # dataframe loading errors; frustrating, look for workaround
>> --
>> #   columns:
>> # 1 mpg
>> # 2 cylinders
>> # 3 displacement
>> # 4 horsepower
>> # 5 weight
>> # 6 acceleration
>> # 7 year
>> # 8 origin
>> --
>> ### option1 - csvread (w/spreadsheet range)
>> Auto = csvread("../data_sets/Auto.csv", "A2:H398")
>> size(Auto)
>> # scatter matrix (option1 Auto)
>> plotmatrix(Auto)    # this import removes "?'s" in 'horsepower' col
>> saveas (1, "plots/octplot4.png")
```
![plot](plots/octplot4.png?raw=true "scatterplot matrix")
```
>> ### option2 - dlmread (w/4-element vector range)
>> Auto = dlmread("../data_sets/Auto.csv", ",", [1,0,396,7])
>> size(Auto)
>> # boxplot (option2 Auto)
>> pkg install -forge statistics
>> pkg load statistics
>> pkg list
>> --
>> mpg = Auto(:,1)
>> cyl = Auto(:,2)
>> --
>> cyl_cat = unique(Auto(:,2)); size(cyl_cat)
>> cyl_cat = reshape(cyl_cat,1,5); size(cyl_cat)
>> --
>> # messing about
>>   # for i = cyl_cat
>>   # Auto([Auto(:,2)==i],1)
>>   # endfor
>> --
>> # messing about
>>   # for i = cyl_cat
>>   # mpg([cyl == i])
>>   # endfor
>> --
>> # source1: http://stackoverflow.com/questions/15344953/octave-boxplot-grouping-variable
>> # source2: http://stackoverflow.com/questions/12375590/octave-boxplot-axis
>> for i = 1:length(cyl_cat)
>>   XG{i} = mpg(cyl == cyl_cat(i));
>> end
>> boxplot(XG);
>> set(gca, 'xtick', [1:5]);
>> set(gca, 'XTickLabel', cyl_cat);
>> title('boxplot: mpg~cyl');
>> xlabel('cylinders');
>> ylabel('mpg');
>> grid;
>> saveas (1, "plots/octplot5.png")
```
![plot](plots/octplot5.png?raw=true "boxplot")
```
>> ### option3 - csv2cell
>> pkg install -forge io
>> pkg load io
>> pkg list    # confirm pkg loaded (look for '*')
>> Auto = csv2cell("../data_sets/Auto.csv", ",")
>> size(Auto)
>> display(Auto(1,:))
>> --
>> # hist (option3 Auto)
>> mpg = [Auto{2:398,1}]
>> hist(mpg,20,'r');
>> title('histogram of mpg');
>> xlabel('mpg');
>> ylabel('frequency');
>> ylim([0,45]);
>> legend('bins = 20');
>> saveas (1, "plots/octplot6.png")
```
![plot](plots/octplot6.png?raw=true "hist")
