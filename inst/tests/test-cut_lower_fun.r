# require(testthat)

context("cut_lower_fun works")


test_that("cut_lower_fun works",{
   
   dend = as.dendrogram(hclust(dist(iris[1:4,-5])))

   # this is really cool!
   expect_identical(
      cut_lower_fun(dend, .4, labels),
      lapply(cut(dend, h = .4)$lower, labels)   
   )

   expect_identical(
      cut_lower_fun(dend, 0, labels),
      lapply(cut(dend, h = 0)$lower, labels)   
   )

   # cut should have returned the tree itself
   # but it FORCES a cut - as opposed to the cut_lower_fun function...
   expect_false(
      identical(
      cut_lower_fun(dend, 40, labels),
      lapply(cut(dend, h = 40)$lower, labels)   )
   )
   
   # cut should have returned the tree itself - instead it returns list()
   # as opposed to the cut_lower_fun function...
   expect_false(
      identical(
         cut_lower_fun(dend, -1, labels),
         lapply(cut(dend, h = -1)$lower, labels)   )
   )
   
   
   
   # returns itself as it should:
   expect_identical(
      cut_lower_fun(dend[[1]], .4, function(x)x),
      list(dend[[1]])  
   )

   # function on a leaf gives what we expect
   expect_identical(
      cut_lower_fun(dend[[1]], .4, labels),
      list("1"))
   
   # cut, however, returns an empty list instead of itself...
   expect_identical(
      cut(dend[[1]], h = .4)$lower,
      list())

   
   
   
   #    require(microbenchmark)
#    microbenchmark(
#       cut_lower_fun(dend, .4, order.dendrogram),
#       lapply(cut(dend, h = .4)$lower, order.dendrogram)   
#    )
   #    # Rcpp is 3 times faster...
#    

   
#    dend_big = as.dendrogram(hclust(dist(iris[1:150,-5])))
#       microbenchmark(
#          cut_lower_fun(dend_big, .4, order.dendrogram),
#          lapply(cut(dend_big, h = .4)$lower, order.dendrogram)   
#       )
      # Rcpp is 16 times faster...
   
   
   
})


