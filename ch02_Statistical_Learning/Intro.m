### vector 
x = [2, 7, 5]

### vector w step
y = 4:3:12

### addition
x + y

### division, element by element
x ./ y

### exponent, element by element
x .^ y

### indexing (1-indexed)
x(2)
x(2:end)
x([1,3])
x(![2])

### matrix: range, reshape, & slice
z = reshape(1:12,4,3)
z([3,4], [2,3])
z(:, [2:3])
z(:,1)    ### retains column/matrix form
size(z(:,1))

### list currently defined variables 
who

### remove variables
clear y
who

### generating random data & plots
x = unifrnd(0,1,1,50)
y = stdnormal_rnd(1,50)

plot(x, y, 'or'); grid; 
print -dpng plots/octplot1.png

plot(x, y, 'b+');  
xlabel('Random Uniform'); 
ylabel('Random Normal');
grid
saveas (1, "plots/octplot2.png")

subplot(2,1,1)
plot(x, y, '.r'); grid;
title('scatter plot');
xlabel('x'); 
ylabel('y');
subplot(2,1,2)
hist(y,10, 'r'); grid;
title('histogram of y');
ylabel('frequency');
saveas (1, "plots/octplot3.png")

### reading in data
### http://octave.sourceforge.net/packages.php
pkg install -forge dataframe
### warning: creating installation directory C:\Octave\Octave-4.0.0\share\octave\packages
pkg list
dataframe("../data_sets/Auto.csv")

