\name{sample.split}
\alias{sample.split}
\title{Split Data into Test and Train Set}
\description{Split data from vector Y into two sets in predefined ratio while 
  preserving relative ratios of different labels in Y. Used to split the data
  used during classification into train and test subsets.
}

\usage{
 sample.split( Y, SplitRatio = 2/3, group = NULL )
}

\arguments{
  \item{Y}{Vector of data labels. If there are only a few labels (as is 
    expected) than relative ratio of data in both subsets will be the same.}
  \item{SplitRatio}{ Splitting ratio: 
    \itemize{
      \item if \code{(0<=SplitRatio<1)} then \code{SplitRatio} fraction of 
      points from Y will be set toTRUE
      \item if \code{(SplitRatio==1)} then one random point from Y will be set 
      to TRUE
      \item if \code{(SplitRatio>1)} then \code{SplitRatio} number of points 
      from Y will be set to TRUE
    }
  }
  \item{group}{Optional vector/list used when multiple copies of each sample 
    are present. In such a case \code{group} contains unique sample labels, 
    marking all copies of the same sample with the same 
    label, and the function tries to place all copies in either train or test 
    subset. If provided than has to have the same length as \code{Y}.}
}

\details{ Function \code{msc.sample.split} is the old name of the 
  \code{sample.split} function. To be retired soon. 
} 

\value{Returns logical vector of the same length as Y with random
  \code{SplitRatio*length(Y)} elements set to TRUE. 
} 

\author{Jarek Tuszynski (SAIC) \email{jaroslaw.w.tuszynski@saic.com}} 

\seealso{
  \itemize{
  \item Similar to \code{\link{sample}} function.
  \item  Variable \code{group} is used in the same way as \code{f} argument in 
   \code{\link{split}} and \code{INDEX} argument in \code{\link{tapply}}
  }
}

\examples{
  library(MASS)
  data(cats)   # load cats data
  Y = cats[,1] # extract labels from the data
  msk = sample.split(Y, SplitRatio=3/4)
  table(Y,msk)
  t=sum( msk)  # number of elements in one class
  f=sum(!msk)  # number of elements in the other class
  stopifnot( round((t+f)*3/4) == t ) # test ratios
  
  # example of using group variable
  g = rep(seq(length(Y)/4), each=4); g[48]=12;
  msk = sample.split(Y, SplitRatio=1/2, group=g)
  table(Y,msk) # try to get correct split ratios ...
  split(msk,g) # ... while keeping samples with the same group label together

  # test results
  print(paste( "All Labels numbers: total=",t+f,", train=",t,", test=",f,
        ", ratio=", t/(t+f) ) )
  U = unique(Y)       # extract all unique labels
  for( i in 1:length(U)) {  # check for all labels
    lab = (Y==U[i])   # mask elements that have label U[i]
    t=sum( msk[lab])  # number of elements with label U[i] in one class
    f=sum(!msk[lab])  # number of elements with label U[i] in the other class 
    print(paste( "Label",U[i],"numbers: total=",t+f,", train=",t,", test=",f, 
                 ", ratio=", t/(t+f) ) )
  }
  
  # use results
  train = cats[ msk,2:3]  # use output of sample.split to ...
  test  = cats[!msk,2:3]  # create train and test subsets
  z = lda(train, Y[msk])  # perform classification
  table(predict(z, test)$class, Y[!msk]) # predicted & true labels
  
  # see also LogitBoost example
}

\keyword{classif}
