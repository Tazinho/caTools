# caTools
This is a fork of the R caTools package (v1.17.1) with some minor modifications

## Modify colAUC

Added a `maxAUC` argument to suppress the line `max(AUC, 1-AUC)`

```{
iris2 <- iris[1:100,]
iris2[["Species"]] <- as.character(iris2[["Species"]])

set.seed(123)
n <- nrow(iris2)

iris2[["random_1"]] <- rnorm(100)
iris2[["random_2"]] <- rnorm(100)
iris2[["random_3"]] <- rnorm(100)
iris2[["random_4"]] <- rnorm(100)

colAUC(iris2[-5], y = iris2[["Species"]])
colAUC(iris2[-5], y = iris2[["Species"]], maxAUC = FALSE)
}