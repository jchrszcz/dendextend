\name{color_labels}
\alias{color_labels}
\alias{colour_labels}
\title{Color tree's labels according to sub-clusters}
\source{
  This function is in the style of
  \code{\link{color_branches}}, and based on
  \code{\link{labels_colors}}.
}
\usage{
  color_labels(tree, k = NULL, h = NULL, labels, col,
    warn = FALSE, ...)
}
\arguments{
  \item{tree}{A \code{dendrogram} or \code{hclust} tree
  object}

  \item{k}{number of groups (passed to
  \code{\link[dendextend]{cutree}})}

  \item{h}{height at which to cut tree (passed to
  \code{\link[dendextend]{cutree}})}

  \item{col}{Function or vector of Colors. By default it
  tries to use \link[colorspace]{rainbow_hcl} from the
  \code{colorspace} package. (with parameters c=90 and
  l=50). If \code{colorspace} is not available, It will
  fall back on the \link{rainbow} function.}

  \item{labels}{character vecotor. If not missing, it
  overrides k and h, and simply colors these labels in the
  tree based on "col" parameter.}

  \item{warn}{logical (FALSE). Should warning be issued?
  (in case h/k/labels are not supplied, or if col is too
  short)}

  \item{...}{ignored.}
}
\value{
  a tree object of class dendrogram.
}
\description{
  This function is for dendrogram and hclust objects. This
  function colors tree's labels.

  The groups will be defined by a call to
  \code{\link[dendextend]{cutree}} using the k or h
  parameters.

  If col is a color vector with a different length than the
  number of clusters (k) - then a recycled color vector
  will be used.
}
\examples{
\dontrun{
hc <- hclust(dist(USArrests), "ave")
dend <- as.dendrogram(hc)
dend=color_labels(dend,5, col = c(3,1,1,4,1))
dend=color_branches(dend,5, col = c(3,1,1,4,1))
plot(dend) # selective coloring of branches AND labels :)

# coloring some labels, based on label names:
dend=color_labels(dend,col = "red", labels = labels(dend)[c(4,16)])
plot(dend) # selective coloring of branches AND labels :)

d5=color_branches(dend,5)
plot(d5)
d5g=color_branches(dend,5,groupLabels=TRUE)
plot(d5g)
d5gr=color_branches(dend,5,groupLabels=as.roman)
plot(d5gr)

}
}
\author{
  Tal Galili
}
\seealso{
  \code{\link[dendextend]{cutree}},\code{\link{dendrogram}},
  \code{\link{hclust}}, \code{\link{labels_colors}},
  \code{\link{color_branches}}
}

