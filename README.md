
# caTools (Modifications)

## colAUC

Add a `maxAUC` argument to optionally suppress `max(AUC, 1-AUC)` line

``` r
devtools::install_github("Tazinho/caTools")
```

    ## Downloading GitHub repo Tazinho/caTools@master
    ## from URL https://api.github.com/repos/Tazinho/caTools/zipball/master

    ## Installing caTools

    ## "C:/PROGRA~1/R/R-34~1.3/bin/x64/R" --no-site-file --no-environ --no-save  \
    ##   --no-restore --quiet CMD INSTALL  \
    ##   "C:/Users/MGO/AppData/Local/Temp/Rtmp0C9H8C/devtools11a86f2b1b52/Tazinho-caTools-dcba4b4"  \
    ##   --library="C:/Users/MGO/Documents/R/win-library/3.4" --install-tests

    ## 

``` r
library(caTools)

iris2 <- iris[1:100,]
iris2[["Species"]] <- as.character(iris2[["Species"]])

set.seed(123)
n <- nrow(iris2)

iris2[["random_1"]] <- rnorm(100)
iris2[["random_2"]] <- rnorm(100)
iris2[["random_3"]] <- rnorm(100)
iris2[["random_4"]] <- rnorm(100)

colAUC(iris2[-5], y = iris2[["Species"]])
```

    ##                       Sepal.Length Sepal.Width Petal.Length Petal.Width
    ## setosa vs. versicolor       0.9326      0.9248            1           1
    ##                       random_1 random_2 random_3 random_4
    ## setosa vs. versicolor   0.5408   0.5884   0.6052   0.5232

``` r
colAUC(iris2[-5], y = iris2[["Species"]], maxAUC = FALSE)
```

    ##                       Sepal.Length Sepal.Width Petal.Length Petal.Width
    ## setosa vs. versicolor       0.0674      0.9248            0           0
    ##                       random_1 random_2 random_3 random_4
    ## setosa vs. versicolor   0.4592   0.4116   0.3948   0.5232
