# Cross Language ML with ISLR Labs


The motivation for this repository is to bring together some of the various techniques I have been exposed to in one place. 

I have decided to use a common data set in order to:

- have a consistent point of reference
- identify similarities among tools
- highlight differences
- mess around with vis tools

The data set and exercises come from <a href="http://www-bcf.usc.edu/~gareth/ISL/" target="_blank">Introduction to Statistical Learning (ISLR)</a>, by Gareth James, Daniela Witten, Trevor Hastie and Robert Tibshirani, and are further informed by their <a href="https://www.youtube.com/user/dataschool/playlists?shelf_id=4&view=50&sort=dd" target="_blank">YouTube series</a>. 

I found the <a href="http://www-bcf.usc.edu/~gareth/ISL/ISLR%20Sixth%20Printing.pdf" target="_blank">ISLR book</a> to be a great learning tool and thought it an ideal candidate for this project. 

I intend to add languages/tools to the table below, a sorta on-going Rosetta Stone of data analysis and visualization, as the majority of checkboxes/rows/colmns get filled in.

| Chapter  | R  | Python  | D3 | MATLAB / Octave | Weka | Excel (?!) |
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
| [Statistical Learning](ch02_Statistical_Learning) | <ul><li>-[x] [intro to R](ch02_Statistical_Learning/Intro.R)</li><li>- [x] [ggplot](ch02_Statistical_Learning/Intro_ggplot.md)</li><li>- [x] [Shiny](ch02_Statistical_Learning/shiny)</li><li>- [x] [rCharts](ch02_Statistical_Learning/shiny/auto_All_rCharts/App.R)</li></ul>| <ul><li>- [x] [Matplotlib][py02]</li><li>- [x] [Seaborn][py02]</li><li>- [x] [Bokeh][py02]</li></ul> | - | <ul><li>- [x] [vectors][oct02]</li><li>- [x] [matrices][oct02]</li><li>- [x] [plots][oct02] </li></ul> | <ul><li>- [x] [summary plots](ch02_Statistical_Learning/Intro_weka.md) </li></ul> | - |
| [Linear Regression](ch03_Linear_Regression) | <ul><li>- [x] [lm](ch03_Linear_Regression/regression.R)</li><li>- [x] [ggplot](ch03_Linear_Regression/regression_ggplot.md)</li><li>- [x] [Shiny](ch03_Linear_Regression/shiny)</li></ul> | <ul><li>- [x] [NumPy][py03]</li><li>- [x] [StatsModels][py03]</li><li>- [x] [scikit-learn][py03]</li></ul> | - | <ul><li>- [x] [lm][oct03]</li><li>- [x] [resid & MSE][oct03]</li><li>- [x] [poly][oct03]</li></ul> | <ul><li>- [x] [classifier output](ch03_Linear_Regression/regression_weka.md) </li></ul> | - |
| [Classification](ch04_Classification) | <ul><li>- [x]  [logit](ch04_Classification/classification1.R), [lda, & knn](ch04_Classification/classification2.R)</li><li>- [x] [Shiny w/ggplot](ch04_Classification/shiny)</li></ul> | <ul><li>- [x] [logit][py04]</li><li>- [x] [lda][py04]</li><li>- [x] [knn][py04]</li></ul> | - | - | - |
| [Resampling Methods](ch05_Resampling_Methods)  | <ul><li>- [x] [cv & bootstrap](ch05_Resampling_Methods/validation.R)</li><li>- [ ] ggplot</li><li>- [ ] Shiny</li></ul>  | - | - | - | - | - |
| [LM Selection & Regularization][ch06] | <ul><li>- [x] [ridge & lasso](ch06_Linear_Model_Selection_and_Regularization/modelselect.Rmd)</li><li>- [x] [Rmd](ch06_Linear_Model_Selection_and_Regularization/modelselect.Rmd)</li><li>- [ ] Shiny</li></ul>  | - | - | - | - | - |
| [Moving Beyond Linearity][ch07] | <ul><li>- [x] [polynomials][ch07_Rmd]</li><li>- [x] [splines][ch07_Rmd]</li><li>- [x] [generalized additive models][ch07_Rmd]</li></ul>  | - | - | - | - | - |
| [Tree Based Methods][ch08] | <ul><li>- [x] [trees, random forest, & boosting](ch08_Tree_Based_Methods/trees.Rmd)</li><li>- [ ] ggplot</li><li>- [ ] Shiny</li></ul>  | - | - | - | - | - |
| [SVM's][ch09]  | <ul><li>- [x] [linear & nonlinear](ch09_Support_Vector_Machines/svm.Rmd) </li></ul>  | - | - | - | - | - |
| [Unsupervised Learning][ch10] | <ul><li>- [x] [PCA, kmeans, & hierarchical clustering](ch10_Unsupervised_Learning/unsupervised.Rmd) </li><li>- [ ] ggplot</li><li>- [ ] Shiny</li></ul>  | - | - | - | - | - |


[py02]: ch02_Statistical_Learning/Intro.ipynb
[py03]: ch03_Linear_Regression/regression.ipynb
[py04]: ch04_Classification/classification.ipynb
[oct02]: ch02_Statistical_Learning/Intro_octave.md
[oct03]: ch03_Linear_Regression/regression_octave.md
[ch06]: ch06_Linear_Model_Selection_and_Regularization
[ch07]: ch07_Moving_Beyond_Linearity
[ch07_Rmd]: ch07_Moving_Beyond_Linearity/nonlinear.Rmd
[ch08]: ch08_Tree_Based_Methods
[ch09]: ch09_Support_Vector_Machines
[ch10]: ch10_Unsupervised_Learning
