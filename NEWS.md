dendextend 0.11.2 (2013-08-31)
----------------------------

UPDATED FUNCTIONS:
   * tanglegram now has "sub" and "cex_sub" parameters.
   * untangle_step_rotate_2side added k_seq parameter.
   * "trim" is now called "prune"!

VIGNETTES:
   * Finished tanglegram and untangle. 
   * Finished statistical measures of similarity between trees. 


dendextend 0.11.1 (2013-08-29)
----------------------------
UPDATED FUNCTIONS:
   * color_labels - added a "warn" parameter. And also set the default (in case no k/h is supplied) - to just color all of the labels.
   * Added "warn" parameter to: assign_values_to_leaves_nodePar, And set it to FALSE when used inside "tanglegram".
   * tanglegram now returns an invisible list with the two dendrograms (after they have been modified within the function).

BUG FIXES:
   * untangle_random_search - made sure the function will return the original trees if no better tree was found.

OTHER NOTES:
   * Seperated 2013-09-05_Boston-useR.Rpres into two files (since RStudio is not able to handle them)

dendextend 0.11.0 (2013-08-24)
----------------------------
VIGNETTES:
   * Added a knitr presentation for "Boston-useR" 2013-09-05. Includes an introduction to hclust and dendrogram objects, tree manipulation, and dendextend modules (still needs the dendextend section on tanglegram...)

UPDATED FUNCTIONS:
   * tangelgram - added cex_main parameter.


OTHER NOTES:
   * Gave proper credit to contributers in the DESCRIPTION file (and not just the .Rd files)

dendextend 0.10.0 (2013-08-20)
----------------------------
NEW FUNCTIONS ADDED: 
   * cut_lower_fun - it wraps the "cut" function, and is built to be masked by the function in dendextendRcpp in order to gain 4-14 speed gain.

NEW TESTS ADDED: 
   * For Bk methods.

OTHER NOTES:
   * The dendextendRcpp package (version 0.3.0) is now on github, and offers functions for making cutree.dendrogram(h) faster (between 4 to 14 times faster).

VIGNETTES:
   * Added cut_lower_fun to the Rcpp section.
   * Added FM-index and Bk plot sections.



dendextend 0.9.2 (2013-08-20)
----------------------------
NEW FUNCTIONS ADDED: 
   * cor_bakers_gamma.hclust

UPDATED FUNCTIONS:
   * cutree.hclust - added the "use_labels_not_values" paremter (ignored)



dendextend 0.9.1 (2013-08-19)
----------------------------
UPDATED FUNCTIONS:
   * color_labels - added "labels" parameter for selective coloring of labels by name.
   * Bk_plot - now adds dots for the asymptotic lines in case of NA's   
   * Bk - now calculates cutree once for all relevant k's - and only then goes forth with FM_index.

BUG FIXES: 
   * FM_index_R - now returns NA when comparing NA vectors (when, for example, there is no possible split for some k), instead of crashing (as it did before).
   * Bk_plot - now won't turn one dendrogram into hclust, while leaving the other a dendrogram.

OTHER NOTES:
   * The dendextendRcpp package (version 0.2.0) is now on github, and offers functions for making cutree.dendrogram(k) MUCH faster (between 20 to 100 times faster). (this is besided having labels.dendrogram now also accept a leaf as a tree.)

VIGNETTES:
   * Added Rcpp section.
   * Started the Bk section (some theory, but no code yet - although it is all written by now...).


dendextend 0.9.0 (2013-08-18)
----------------------------
NEW FUNCTIONS ADDED: 
   * sort_2_clusters_vectors
   * FM_index_profdpm 
   * FM_index_R
   * FM_index
   * FM_index_permutation - for checking permutation distribution of the FM Index
   * Bk
   * Bk_permutations
   * Bk_plot (it can be MUCH slower for dendrograms with large trees, but works great for hclust)

UPDATED FUNCTIONS:
   * color_labels - removed unused 'groupLabels' parameter.

VIGNETTES:
   * Added the FM Index section.

FILE CHANGES:
   * Bk-method.r file added.

OTHER NOTES:
   * The dendextendRcpp package (version 0.1.1) is now on github, and offers a faster labels.dendrogram function (It is 20 to 40 times faster than the 'stats' function!)
   * Added a commented-out section which could (in the future) be the basis of an Rcpp cutree (actually cutree_1h.dendrogram) function!


dendextend 0.8.0 (2013-08-14)
----------------------------
NEW FUNCTIONS ADDED: 
   * cor_bakers_gamma
   * sample.dendrogram
   * rank_order.dendrogram - for fixing leaves value order.
   * duplicate_leaf - for sample.dendrogram
   * sample.dendrogram - for bootstraping trees when the original data table is missing.

   * sort_dist_mat
   * cor_cophenetic

UPDATED FUNCTIONS:
   * tanglegram - added the match_order_by_labels parameter.

VIGNETTES:
   * Added the Baker's Gamma Index section.
   * Added a bootstrap and permutation examples for inference on Baker's Gamma.
   * Also for Cophenetic correlation.

FILE CHANGES:
   * sample.dendrogram.r file added.

BUG FIXES: 
   * fix_members_attr.dendrogram - fixed a bug introduced by the new "members" method in nleaves. (test added)

dendextend 0.7.3 (2013-08-14)
----------------------------
NEW FUNCTIONS ADDED: 
   * get_childrens_heights - Get height attributes from a dendrogram's children
   * rank_branches - ranks the heights of branches - making comparison of the topologies of two trees easier.

UPDATED FUNCTIONS:
   * sort_levels_values - now returns a vector with NA's as is without changing it. Also, a warning is issued (with a parameter to supress the warning called 'warn')
   * cutree - now supresses warnings produced by sort_levels_values, in the case of NA values.
   * plotNode_horiz now uses "Recall" (I might implement this in more function).
   * tanglegram - added parameters hang and rank_branches.

BUG FIXES: 
   * tanglegram - fixed the right tree's labels position relative to the leaves tips. (they were too far away because of a combination of text_adj with dLeaf)

VIGNETTES:
   * Fixed the dLeaf in tanglegram plots, and gave an example of using rank_branches. 


dendextend 0.7.2 (2013-08-13)
----------------------------
NEW FUNCTIONS ADDED: 
   * plotNode_horiz - allows the labels, in plot_horiz.dendrogram, to be aligned to the leaves tips when the tree is plotted horizontally, its leaves facing left.

UPDATED FUNCTIONS:
   * plot_horiz.dendrogram - allows the labels to be aligned to the leaves tips when the tree is plotted horizontally, its leaves facing left. (took a lot of digging into internal functions used by plot.dendrogram)
   * tanglegram - added the parameters: dLeaf_left dLeaf_right. Also, labels are now alligned to the leaves tips in the right dendrogram.

BUG FIXES: 
   * Fix untangle_step_rotate_1side to work with non-missing dend_heights_per_k
   * Set sort_cluster_numbers = TRUE for cutree, in order to make it compatible with stats:::cutree. Added a test for this.
   * Fix cutree.hclust to work with a vector of k when !order_clusters_as_data
   * Fix cutree.dendrogram to give default results as stats:::hclust does, by setting the default to sort_cluster_numbers = TRUE.

OTHER NOTES:
   * Variations of the changes to plot_horiz.dendrogram and plotNode_horiz should be added to R core in order to allow forward compatability.


dendextend 0.7.1 (2013-08-12)
----------------------------
NEW FUNCTIONS ADDED: 
   * untangle_step_rotate_2side

NEW VIGNETTES SECTIONS ADDED:
   * untangle_forward_rotate_2side


dendextend 0.7 (2013-08-11)
---------------------------
NEW FUNCTIONS ADDED: 
   * shuffle - Random rotation of trees
   * untangle_random_search - random search for two trees with low entanglement.
   * flip_leaves
   * all_couple_rotations_at_k
   * untangle_forward_rotate_1side

OTHER NOTES:
   * rotate - minor code improvements.

NEW VIGNETTES SECTIONS ADDED:
   * untangle_random_search 
   * untangle_forward_rotate_1side


dendextend 0.6 (2013-08-10) 
---------------------------
NEW FUNCTIONS ADDED: 
   * tanglegram - major addition!
   * plot_horiz.dendrogram - Plotting a left-tip-adjusted horizontal dendrogram
   * remove_leaves_nodePar
   * assign_values_to_branches_edgePar
   * remove_branches_edgePar

   * match_order_by_labels
   * match_order_dendrogram_by_old_order - like match_order_by_labels, but faster
   * entanglement

UPDATED FUNCTIONS:
   * assign_values_to_leaves_nodePar - now makes sure pch==NA if we are modifying a nodePar value which is other than pch (and pch did not exist before).
   * nleaves - now allow the use of the "members" attr of a dendrogram for telling us the size of the tree.

OTHER NOTES:
   * entanglement.r file added
   * untangle.r file added

NEW VIGNETTES SECTIONS ADDED:
   * Tanglegram
   * Entanglement


dendextend 0.5 (2013-08-05) 
---------------------------
NEW FUNCTIONS ADDED: 
   * tanglegram

UPDATED FUNCTIONS:
   * rotate - fixes calling the same functions more than once (minor improvements)
   * fac2num - keep_names parameter added
   * intersect_trees - added the "warn" parameter.

NEW TESTS:
   * order.dendrogram gives warning and can be changed
   * fac2num works


dendextend 0.4 (2013-08-02) 
---------------------------
NEW FUNCTIONS ADDED: 
(including tests and documentation)
   * is.natural.number
   * cutree_1h.dendrogram - like cutree, but only for 1 height value.
   * fix_members_attr.dendrogram - just to validate that prune works o.k.
   * hang.dendrogram - hangs a dendrogram leaves (also allows for a rotated hanged dendrogram), works also for non-binary trees.
   * nnodes - count the number of nodes in a tree
   * as.dendrogram.phylo - based on as.hclust.
   * get_nodes_attr - allows easy access to attributes of branches and leaves
   * get_branches_heights
   * fix_members_attr.dendrogram
   * heights_per_k.dendrogram - get the heights for a tree that will yield each k cluster.
   * is.hclust
   * is.dendrogram
   * is.phylo
   * fac2num
   * as.phylo.dendrogram - based on as.hclust.
   
   * cutree_1k.dendrogram - like cutree, but only for 1 k (number of clusters) value.
   * cutree.dendrogram - like cutree but for dendrograms (and it is also vectorized)
   * cutree.hclust - like cutree but for hclust
   * cutree.phylo - like cutree but for phylo
   * sort_levels_values - make the resulting clusters from cutree to be ordered from left to right
   * cutree - with S3 methods for dendrogram/hclust/phylo

   * color_branches - color a tree branches based on its clusters. This is a modified version of the color_clusters function from jefferis's dendroextra package. It extends it by using my own version of cutree.dendrogram - allowing the function to work for trees that hclust can not handle (unrooted and non-ultrametric trees). Also, it allows REPEATED cluster color assignments to branches on to the same tree. Something which the original function was not able to handle. It also handles extreme cases, such as when the labels of a tree are integers.
   * color_labels - just like color_branches, but for labels.
   
   * assign_values_to_leaves_nodePar - allows for complex manipulation of dendrogram's leaves parameters.

UPDATED FUNCTIONS:
   * nleaves - added nleaves.phylo methods, based on as.hclust so it could be improved in the future.
   * "labels_colors<-" - fixed it so that by default it would not add phc=1 to the leaves.
   * "order.dendrogram<-" - now returns an integer (instead of numeric)
   * cutree (cutree.dendogram / cutree.hclust) - Prevent R from crashing when using 
cutree on a subset tree (e.g: dend[[1]])
   * Renaming the unroot function -> to -> unbranch 
   * get_leaves_attr - added a simplify parameter.

OTHER NOTES:
   * Updated the exact way the GPL was stated in DESCRIPTION and gave a better reference within each file.

NEW VIGNETTES SECTIONS ADDED:
   * Hanging trees
   * Coloring branches.
   

dendextend 0.3 (2013-07-27) 
---------------------------
NEW FUNCTIONS ADDED:
   * removed "flip", added rev.hclust instead (since rev.dendrogram already exists)

NEW VIGNETTES SECTIONS ADDED:
   * Vignettes created (using LaTeX)
   * Basic introduction to dendrogram objects
   * Labels extraction and assignment, and measuring tree size.
   * Tree manipulation: unrooting, pruning, label coloring, rotation

NEW TESTS ADDED:
   * labels extraction, assignment and tree size (especially important for comparing hclust and dendrogram!)
   * Tree manipulation: unrooting, pruning, label coloring, rotation

UPDATED FUNCTIONS:
   * "labels.hclust" - added the "order" parameter. (based on some ideas from Gregory Jefferis's dendroextras package)
   * "labels.hclust" and "labels.hclust<-" - now both use order=TRUE as default. this makes them consistent with labels.dendrogram. Proper tests have been implemented.
   * "labels<-.dendrogram" - make sure the new dendrogram does not have each of its node of class "dendrogram" (which happens when using dendrapply)
   * unclass_dend - now uses dendrapply
   * get_branches_attr - added "warning" parameter
   * unroot.dendrogram - Can now deal with unrooting more than 3 branches. supresses various warnings. 
   * as_hclust_fixed - now works just as as.hclust when hc is missing.
   * rotate - allowed "order" to accept character vector.

OTHER NOTES:
   * Extending the documentation for: rotate, labels.hclust,
   * Added a welcome massage to when loading the package (zzz.r file added)
   * Added a first template for browseVignettes(package ='dendextend')
   * Added a tests folder - making the foundation for using testthat.
      * Added tests for labels assignment
   * Added a clear GPL-2+ copyright notice on each r file.
	* Forcing {ape} to load before {dendextend}, thus allowing for both rotate and unroot to work for BOTH packages. It does add extra noise when loading the package, but it is the best solution I can think of at this point.


dendextend 0.2 (2013-04-10) 
---------------------------
NEW FUNCTIONS ADDED:
   * count_terminal_nodes
   * labels_colors (retrieving and assignment)
   * unclass_dend
   * head.dendrogram (S3 method for dendrogram)
   * nleaves (with S3 methods for dendrogram and hclust)
   * rotate (with S3 methods for dendrogram, hclust and phylo)
   * sort (with S3 methods for dendrogram and hclust)
   * flip (works for both dendrogram and hclust)
   * prune - prunes leaves off a dendrogram/hclust/phylo trees. (based on the prune_leaf function)
   * as_hclust_fixed
   * get_branches_attr
   * unroot (dendrogram/hclust/phylo)
   * raise.dendrogram
   * flatten.dendrogram
   * order.dendrogram<-
   * intersect_trees

UPDATED FUNCTIONS:
   * "labels<-.dendrogram" - made sure to allow shorter length of labels than the size of the tree (now uses recycling).  This version is now sure to deal correctly with labeling trees with duplicate labels.

OTHER NOTES:
   * From here on I will be using "." only for S3 method functions.  Other functions will use "_"
   * Added more .r files, and changed the locations of some functions.

dendextend 0.1 (2013-04-05) - FIRST version!
--------------------------------------------

NEW FUNCTIONS ADDED:
   * S3 methods for label assignment operator for vector, dendrogram, hclust, matrix.

OTHER NOTES:
	* Includes skeletons for some functions that will be added in the future.
	

	



TODO for future releases:
-------------------------
   * add functions...
   * Fix the demo / or work on a nice vignette
   * add a print/warn parameter to intersect_trees
   * add rect.hclust.nice http://stackoverflow.com/questions/4720307/change-dendrogram-leaves 
   * Give this a thought: http://stackoverflow.com/questions/10088117/exporting-dendrogram-as-table-in-r?rq=1
   * reply here: http://stackoverflow.com/questions/10571266/colouring-branches-in-a-dendrogram-in-r?rq=1
   * create rect.dendrogram (and make rect generic). http://stackoverflow.com/questions/717747/how-do-i-color-edges-or-draw-rects-correctly-in-an-r-dendrogram
http://stackoverflow.com/questions/4720307/change-dendrogram-leaves
   * hide some function's doc (labels<-.stuff)
   * cite agnes/cluster and http://cran.r-project.org/web/packages/cluster/cluster.pdf
   Maybe also spantree {vegan}
   * boot_dend - create a same-size tree, while sampling (with repetition) the leaves! # later for boot
   * An algorithm to find subtrees that are topologically identical between the two trees - and color them accordingly.
   * Get stats:::midcache.dendrogram to work for non-binary trees...
   * cut_replace - make it in Rcpp - to make cutree_1h.dendrogram faster...