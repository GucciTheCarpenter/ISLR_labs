### medv~lstat+age
```
=== Run information ===

Scheme:weka.classifiers.functions.LinearRegression -S 0 -R 1.0E-8
Relation:     Boston-weka.filters.unsupervised.attribute.Remove-R1-6,8-12
Instances:    506
Attributes:   3
              age
              lstat
              medv
Test mode:10-fold cross-validation

=== Classifier model (full training set) ===


Linear Regression Model

medv =

      0.0345 * age +
     -1.0321 * lstat +
     33.2228

Time taken to build model: 0.04 seconds

=== Cross-validation ===
=== Summary ===

Correlation coefficient                  0.7345
Mean absolute error                      4.5573
Root mean squared error                  6.2357
Relative absolute error                 68.3517 %
Root relative squared error             67.6389 %
Total Number of Instances              506     


```
### all statistically relevant features
```
=== Run information ===

Scheme:weka.classifiers.functions.LinearRegression -S 0 -R 1.0E-8
Relation:     Boston
Instances:    506
Attributes:   14
              crim
              zn
              indus
              chas
              nox
              rm
              age
              dis
              rad
              tax
              ptratio
              black
              lstat
              medv
Test mode:10-fold cross-validation

=== Classifier model (full training set) ===


Linear Regression Model

medv =

     -0.1084 * crim +
      0.0458 * zn +
      2.7187 * chas +
    -17.376  * nox +
      3.8016 * rm +
     -1.4927 * dis +
      0.2996 * rad +
     -0.0118 * tax +
     -0.9465 * ptratio +
      0.0093 * black +
     -0.5226 * lstat +
     36.3411

Time taken to build model: 0.12 seconds

=== Cross-validation ===
=== Summary ===

Correlation coefficient                  0.8451
Mean absolute error                      3.3933
Root mean squared error                  4.9145
Relative absolute error                 50.8946 %
Root relative squared error             53.3085 %
Total Number of Instances              506     


```
