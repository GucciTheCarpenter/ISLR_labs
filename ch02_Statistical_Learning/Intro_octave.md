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
