\name{Bk_plot}
\alias{Bk_plot}
\title{Bk plot - ploting the Fowlkes-Mallows Index of two dendrogram for various k's}
\usage{
  Bk_plot(tree1, tree2, k, add_E = TRUE,
    rejection_line_asymptotic = TRUE,
    rejection_line_permutation = FALSE, R = 1000,
    k_permutation, conf.level = 0.95,
    p.adjust.methods = c("none", "bonferroni"),
    col_line_Bk = 1, col_line_asymptotic = 2,
    col_line_permutation = 4, warn = TRUE,
    main = "Bk plot", xlab = "k (number of clusters)",
    ylab = "Bk (Fowlkes-Mallows Index)", xlim,
    ylim = c(0, 1), try_cutree_hclust = TRUE, ...)
}
\arguments{
  \item{tree1}{a dendrogram/hclust/phylo object.}

  \item{tree2}{a dendrogram/hclust/phylo object.}

  \item{k}{an integer scalar or vector with the desired
  number of cluster groups. If missing - the Bk will be
  calculated for a default k range of 2:(nleaves-1). No
  point in checking k=1/k=n, since both will give Bk=1.}

  \item{add_E}{logical (TRUE). Should we add a line of the
  Expected Bk value for each k, under the null hypothesis
  of no relation between the clusterings?}

  \item{rejection_line_asymptotic}{logical (TRUE). Should
  we add a line of the one sided rejection region based on
  the asymptotic distribution of Bk values, for each k,
  under the null hypothesis of no relation between the
  clusterings?}

  \item{rejection_line_permutation}{logical (FALSE). Should
  we add a line of the one sided rejection region based on
  the asymptotic distribution of Bk values, for each k,
  under the null hypothesis of no relation between the
  clusterings?}

  \item{R}{integer (Default is 1000). The number of Bk
  permutation to perform for each k. Applicable only if
  rejection_line_permutation is TRUE.}

  \item{k_permutation}{the k's to be used for permutation
  (sometimes we might be only interested in some k's and it
  is not important to run the simulation for all possible
  ks). If missing - k itself will be used.}

  \item{conf.level}{the level of one sided confidence
  interval used for creation of the rejection lines.}

  \item{p.adjust.methods}{a character scalar of either
  "none" (default), or "bonferroni". This controls the
  multiple correction method to use for the critical
  rejection values. Currently only the Bonferroni method is
  implemented (based on the number of different k values).}

  \item{col_line_Bk}{the color of the Bk line.}

  \item{col_line_asymptotic}{the color of the rejection
  asymptotic Bk line.}

  \item{col_line_permutation}{the color of the rejection
  asymptotic Bk line.}

  \item{warn}{logical (TRUE). Should a warning be issued in
  case of problems? If set to TRUE, extra checks are made
  to varify that the two clusters have the same size and
  the same labels.}

  \item{main}{passed to \link{plot}.}

  \item{xlab}{passed to \link{plot}.}

  \item{ylab}{passed to \link{plot}.}

  \item{xlim}{passed to \link{plot}. If missign, xlim is
  from 2 to nleaves-1}

  \item{ylim}{passed to \link{plot}.}

  \item{try_cutree_hclust}{logical (TRUE). Since cutree for
  hclust is MUCH faster than for dendrogram - Bk_plot will
  first try to change the dendrogram into an hclust object.
  If it will fail (for example, with unbranched trees), it
  will continue using the cutree.dendrogram functions. If
  try_cutree_hclust=FALSE, it will force to use
  cutree.dendrogram and not cutree.hclust.}

  \item{...}{Ignored.}
}
\value{
  After plotting the Bk plot. Returns (invisible) the
  output of the elements used for constructing the plot:
  The Bk values, Bk permutations (if used), Bk theoratical
  values, etc.
}
\description{
  Bk is the calculation of Fowlkes-Mallows index for a
  series of k cuts for two dendrograms. A Bk plot is simply
  a scatter plot of Bk versus k. This plot helps in
  identifiying the similarity between two dendrograms in
  different levels of k (number of clusters).
}
\details{
  From Wikipedia:

  Fowlkes-Mallows index (see references) is an external
  evaluation method that is used to determine the
  similarity between two clusterings (clusters obtained
  after a clustering algorithm). This measure of similarity
  could be either between two hierarchical clusterings or a
  clustering and a benchmark classification. A higher the
  value for the Fowlkes-Mallows index indicates a greater
  similarity between the clusters and the benchmark
  classifications.

  The default Bk plot comes with a line with dots (type
  "b") of the Bk values. Also with a fragmented (lty=2)
  line (of the same color) of the expected Bk line under
  H0, And a solid red line of the upper critical Bk values
  for rejection
}
\examples{
\dontrun{

set.seed(23235)
ss <- TRUE # sample(1:150, 10 )
hc1 <- hclust(dist(iris[ss,-5]), "com")
hc2 <- hclust(dist(iris[ss,-5]), "single")
# tree1 <- as.treerogram(hc1)
# tree2 <- as.treerogram(hc2)
#    cutree(tree1)

Bk_plot(hc1, hc2, k = 2:20, xlim = c(2,149))
Bk_plot(hc1, hc2)

Bk_plot(hc1, hc2, k = 3)
Bk_plot(hc1, hc2, k = 3:10)
Bk_plot(hc1, hc2)
Bk_plot(hc1, hc2,p.adjust.methods="bonferroni") # higher rejection lines

# this one can take a bit of time:
Bk_plot(hc1, hc2, rejection_line_permutation=TRUE, k_permutation = c(2,4,6,8,10,20,30,40,50), R= 100)
# we can see that the permutation line is VERY close to the asymptotic line.
# This is great since it means one can often use the asymptotic results
# Without having to do many simulations.

# works just as well for dendrograms:
dend1 <- as.dendrogram(hc1)
dend2 <- as.dendrogram(hc2)
Bk_plot(dend1, dend2, k = 2:3, try_cutree_hclust = FALSE) # slower than hclust, but works...
Bk_plot(hc1, dend2, k = 2:3, try_cutree_hclust = FALSE) # slower than hclust, but works...
Bk_plot(dend1, dend1, k = 2:3, try_cutree_hclust = TRUE) # slower than hclust, but works...
Bk_plot(hc1, hc1, k = 2:3) # slower than hclust, but works...
# for some reason it can't turn dend2 back to hclust :(
a= Bk_plot(hc1, hc2, k = 2:3, try_cutree_hclust = TRUE) # slower than hclust, but works...

hc1_mixed <- as.hclust(sample(as.dendrogram(hc1)))
Bk_plot(tree1=hc1, tree2=hc1_mixed,
        add_E=FALSE,
        rejection_line_permutation=TRUE, k_permutation = c(2,4,6,8,10,20,30,40,50), R= 100)



}
}
\references{
  Fowlkes, E. B.; Mallows, C. L. (1 September 1983). "A
  Method for Comparing Two Hierarchical Clusterings".
  Journal of the American Statistical Association 78 (383):
  553.

  \url{http://en.wikipedia.org/wiki/Fowlkes-Mallows_index}
}
\seealso{
  \code{\link{FM_index}}, \link{Bk}, \link{Bk_permutations}
}

