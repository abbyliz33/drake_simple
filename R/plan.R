plan <- drake_plan(
   taxon_names = read.csv(file=file_in("data/taxa.csv")),
   tree.id = rotl:: tnrs_match_names(taxon_names$Taxon[1])$ott_id,
   tree = rotl::tol_subtree(ott_id=tree.id),
   tree_resolution = ape::Nnode(tree)/(ape::Ntip(tree)-1),
   tree_print = plot_tree(tree, file_out("results/tree.3.pdf")),
   #ape::plot.phylo("__________", type="fan", cex=0.2)
   even = is_even(tree),
   #plotted = plot_tree(phy, file_out("results/tree.3.pdf")),
   save_even = save(tree, even, file=file_out("results/even.rda"))
)
