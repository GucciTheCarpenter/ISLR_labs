## Running Shiny Apps off GitHub

You can run these apps directly in R, with no need to download or fork, as long as you have the **shiny** package installed and active. 
```
install.packages("shiny")
library(shiny)
```

Reference the repo (**"ISLR_labs"**), user (**"GucciTheCarpenter"**), and your app/subfolder of choice as the 'subdir' (eg. **"ch03_Linear_Regression/shiny/boston_poly/"**).

Full example:
```
runGitHub("ISLR_Labs", "GucciTheCarpenter", subdir = "ch03_Linear_Regression/shiny/boston_poly/")
```
