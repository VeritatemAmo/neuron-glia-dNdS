# neuron-glia-dNdS
Contains the codes for analyzing dN/dS values of neuron-specific genes and glial cell-specific genes across mammalian species. 

## Sequence of the Pipeline
### Mouse Reference Genome
1) run ./bash_scripts/mouse_protein_coding_dNdS.sh to download dN values, dS values, etc of protein-coding genes from Ensembl.
Generate ./results/Ensembl98_mouse/mouse_protein_coding_genes.*.txt, One txt file for each of the 93 species with dN and dS values against mouse reference genome.
2) run ./jupyter_notebooks/mouse.all_genes.ipynb to merge all 93 species together. 
Generate ./results/Ensembl98_mouse/mouse.92_species_dNdS.all_genes.tsv
and ./results/Ensembl98_mouse/mouse.dNdS_stats.all_genes.tsv
Visualize distribution of all genes' average dN/dS values, saved to ./figures/mouse.all_genes.*
3) run ./jupyter_notebooks/mouse.celltype-expression.ipynb to merge Barres expression data with dN/dS data. 
Generate ./results/mouse.celltype-expression.tsv
4) run ./jupyter_notbooks/mouse.celltype-specific-genes.ipynb to define cell type-specific genes. 
Generate ./results/mouse.celltype-specific_genes/all_barres/*.list.txt, one gene list for each cell type. 
Visualize the overlap between the lists with Venn diagrams, saved to ./figures/Venn_Diagrams/all_barres/*
5) run ./jupyter_notebooks/mouse.stats_and_figures.ipynb, calculate Mann Whitney stats for each pair of cell type
for a couple of representative species as well as averaged dN/dS. Kruskal Wallis test was used for testing more than two cell types.
Generate ./results/mouse.celltype-specific_genes/protein-coding_w_dNdS/MannWhitney/*.tsv
Visualize ./figures/MannWhitney/mouse_reference_genome/*.pdf
and ./figures/MannWhitney/mouse.boxplots.pdf
