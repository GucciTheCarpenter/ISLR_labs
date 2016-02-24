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
path    ### current load path
addpath('C:\Octave\Octave-4.0.0\share\octave\packages\dataframe-1.1.0')
pkg load dataframe
pkg list    # confirm pkg loaded (look for '*')
Auto = dataframe("../data_sets/Auto.octave.csv")    # dataframe loading errors; frustrating, look for workaround

#   columns:
# 1 mpg
# 2 cylinders
# 3 displacement
# 4 horsepower
# 5 weight
# 6 acceleration
# 7 year
# 8 origin

### option1 - csvread (w/spreadsheet range)
Auto = csvread("../data_sets/Auto.csv", "A2:H398")
size(Auto)
# scatter matrix (option1 Auto)
plotmatrix(Auto)    # this import removes "?'s" in 'horsepower' col
saveas (1, "plots/octplot4.png")

### option2 - dlmread (w/4-element vector range)
Auto = dlmread("../data_sets/Auto.csv", ",", [1,0,396,7])
size(Auto)
# boxplot (option2 Auto)
pkg install -forge statistics
pkg load statistics
pkg list

mpg = Auto(:,1)
cyl = Auto(:,2)

cyl_cat = unique(Auto(:,2)); size(cyl_cat)
cyl_cat = reshape(cyl_cat,1,5); size(cyl_cat)

# for i = cyl_cat
# Auto([Auto(:,2)==i],1)
# endfor

for i = cyl_cat
mpg([cyl == i])
endfor

# source: http://stackoverflow.com/questions/15344953/octave-boxplot-grouping-variable
for i = 1:length(cyl_cat)
  XG{i} = X(G == cyl_cat(i));
 end
 boxplot(XG);

x = [1, 2, 4];
y1 = [6, 2, 3, 15];
y2 = [1, 7, 3];
y3 = [1, 9, 2];

boxplot ({y1,y2,y3});
set(gca, 'xtick', [1:3]);
set(gca,'XTickLabel',x);
refresh;


### option3 - csv2cell
pkg install -forge io
pkg load io
pkg list    # confirm pkg loaded (look for '*')
Auto = csv2cell("../data_sets/Auto.csv", ",")
size(Auto)
Auto(1,:)

# hist (option3 Auto)
mpg = [Auto{2:398,1}]
hist(mpg,20,'r');
title('histogram of mpg');
xlabel('mpg');
ylabel('frequency');
ylim([0,45]);
legend('bins = 20');
saveas (1, "plots/octplot5.png")
