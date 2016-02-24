# Cross Language ML with ISLR Labs


The motivation for this repository is to bring together some of the various techniques I have been exposed to in one place. 

I have decided to use a common data set in order to:

- have a consistent point of reference
- identify similarities among tools
- highlight differences
- blah, blah, blah

The data set and exercises come from <a href="http://www-bcf.usc.edu/~gareth/ISL/" target="_blank">Introduction to Statistical Learning (ISLR)</a>, by Gareth James, Daniela Witten, Trevor Hastie and Robert Tibshirani, and are further informed by their <a href="https://www.youtube.com/user/dataschool/playlists?shelf_id=4&view=50&sort=dd" target="_blank">YouTube series</a>. 

I found the <a href="http://www-bcf.usc.edu/~gareth/ISL/ISLR%20Sixth%20Printing.pdf" target="_blank">ISLR book</a> to be a great learning tool and thought it an ideal candidate for this project. 

I intend to continue adding languages/tools to the table below, a sorta on-going Rosetta Stone of data analysis and visualization.

| Chapter  | R  | Python  | D3 | MATLAB/Octave | Weka | tbd |
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
| [Statistical Learning](ch02_Statistical_Learning) | <ul><li>-[x] [intro to R](ch02_Statistical_Learning/Intro.R)</li><li>- [x] [ggplot](ch02_Statistical_Learning/Intro_ggplot.md)</li><li>- [x] [Shiny](ch02_Statistical_Learning/shiny)</li></ul>| <ul><li>- [x] [Matplotlib][py02]</li><li>- [x] [Seaborn][py02]</li><li>- [x] [Bokeh][py02]</li></ul> | - | <ul><li>- [x] [vectors][oct02]</li><li>- [x] [matrices][oct02]</li><li>- [x] [plots][oct02] </li></ul> | <ul><li>- [x] [summary plots](ch02_Statistical_Learning/Intro_weka.md) </li></ul> | - |
| [Linear Regression](ch03_Linear_Regression) | <ul><li>- [x] [lm](ch03_Linear_Regression/regression.R)</li><li>- [x] [ggplot](ch03_Linear_Regression/ch03_ggplot.md)</li><li>- [ ] Shiny</li></ul> | <ul><li>- [x] [NumPy][py03]</li><li>- [x] [StatsModels][py03]</li><li>- [x] [scikit-learn][py03]</li></ul> | - | - | <ul><li>- [x] [classifier output](ch03_Linear_Regression/ch03_weka.md) </li></ul> | - |
| [Classification](ch04_Classification) | <ul><li>- [x]  [logit](ch04_Classification/classification1.R), [lda, & knn](ch04_Classification/classification2.R)</li><li>- [ ] ggplot</li><li>- [ ] Shiny</li></ul> | - | - | - | - |
| [Resampling Methods](ch05_Resampling_Methods)  | <ul><li>- [x] [cv & bootstrap](ch05_Resampling_Methods/validation.R)</li><li>- [ ] ggplot</li><li>- [ ] Shiny</li></ul>  | - | - | - | - | - |
| [LM Selection & Regularization][ch06] | <ul><li>- [ ] default setup</li><li>- [ ] [Rmd](ch06_Linear_Model_Selection_and_Regularization/modelselect.Rmd)</li><li>- [ ] Shiny</li></ul>  | - | - | - | - | - |
| Moving Beyond Linearity  | <ul><li>- [ ] default setup</li><li>- [ ] ggplot</li><li>- [ ] Shiny</li></ul>  | - | - | - | - | - |
| Tree Based Methods | <ul><li>- [ ] default setup</li><li>- [ ] ggplot</li><li>- [ ] Shiny</li></ul>  | - | - | - | - | - |
| SVM's  | <ul><li>- [ ] default setup</li><li>- [ ] ggplot</li><li>- [ ] Shiny</li></ul>  | - | - | - | - | - |
| Unsupervised Learning | <ul><li>- [ ] default setup</li><li>- [ ] ggplot</li><li>- [ ] Shiny</li></ul>  | - | - | - | - | - |


[py02]: ch02_Statistical_Learning/Intro.ipynb
[py03]: ch03_Linear_Regression/regression.ipynb
[oct02]: ch02_Statistical_Learning/Intro_octave.md
[ch06]: ch06_Linear_Model_Selection_and_Regularization
