## Running Shiny Apps off GitHub

You can run these apps directly in R, with no need to download or fork, as long as you have the shiny package installed and active. 
```
install.packages("shiny")
library(shiny)
```

Reference the repo (**"ISLR_labs"**), user (**"GucciTheCarpenter"**), and your app/subfolder of choise as the 'subdir' (eg. **"ch02_Statistical_Learning/shiny/scatter_xy/"**).

Full example:
```
runGitHub("ISLR_Labs", "GucciTheCarpenter", subdir = "ch02_Statistical_Learning/shiny/scatter_xy/")
```
