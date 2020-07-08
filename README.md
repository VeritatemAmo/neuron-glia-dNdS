# neuron-glia-dNdS #

Contains the codes for analyzing dN/dS values of neuron-specific genes and glial cell-specific genes across mammalian species. 

## Sequence of the Pipeline ##

### Mouse Reference Genome ###

* run ./bash_scripts/mouse_protein_coding_dNdS.sh to download dN values, dS values, etc of protein-coding genes from Ensembl.
	* Generate ./results/Ensembl98_mouse/mouse_protein_coding_genes.*.txt, One txt file for each of the 92 species with dN and dS values against mouse reference genome.
* run ./jupyter_notebooks/mouse.all_genes.ipynb to merge all 92 species together. 
	* Generate ./results/Ensembl98_mouse/mouse.92_species_dNdS.all_genes.tsv
	* and ./results/Ensembl98_mouse/mouse.dNdS_stats.all_genes.tsv
	* Visualize distribution of all genes' average dN/dS values, saved to ./figures/mouse.all_genes.*
* run ./jupyter_notebooks/mouse.celltype-expression.ipynb to calculate oligodendrocyte expression level from three subtypes and glial cell expression level from oligodendrocyte, microglia, and astrocyte
	* Generate ./results/mouse.celltype-expression.tsv

#### Analyzing dN/dS of Celltype-specific genes ####

* run ./jupyter_notbooks/mouse.celltype-specific-genes.ipynb to define cell type-specific genes. 
	* Generate ./results/mouse.celltype-specific_genes/all_barres/*.list.txt, one gene list for each cell type. 
	* Visualize the overlap between the lists with Venn diagrams, saved to ./figures/Venn_Diagrams/all_barres/*
* run ./jupyter_notebooks/mouse.celltype-specific_protein-coding_genes_w_dNdS.ipynb to merge protein-coding genes and dN/dS to celltype-specific genes
	* Generate ./results/mouse.celltype-specific_genes/protein-coding_w_dNdS/*/*.tsv, one per species per cell type, including averaged 92 species dN/dS
* run ./jupyter_notebooks/mouse.stats_and_figures.ipynb, calculate Mann Whitney stats for each pair of cell type for a couple of representative species as well as averaged dN/dS. Kruskal Wallis test was used for testing more than two cell types.
	* Generate ./results/mouse.celltype-specific_genes/protein-coding_w_dNdS/MannWhitney/*.tsv
    * and ./results/celltype-specific_descriptive_stats.xlsx
    * and ./results/celltype-specific_inferential_stats.xlsx
	* Visualize ./figures/MannWhitney/mouse_reference_genome/*.pdf
	* and ./figures/MannWhitney/mouse.boxplots.pdf
* run ./jupyter_notebooks/mouse.GO-celltype-contingency.ipynb, analyze whether a few GOs are responsible for the neuron-specific genes with the lowest dN/dS, or if the pattern is universal throughout GOs. 
    * Generate ./results/celltype-specific_GOs.xlsx
    * and ./results/NEAMO-specific_GOs.xlsx, which just takes out glia from the above file
    * and ./results/GO_contingency_stats.xlsx
    * Visualize ./figures/contingency_analysis/*.pdf
    
#### Analyzing dN/dS of Celltype-expressed genes ####

* run ./jupyter_notebooks/mouse.celltype-expressed-genes.ipynb, get list of genes expressed in each celltype with RPKM threshold of 1
	* Generate ./results/mouse.celltype-expressed_genes/all_barres/*.list.txt
	* Visualize ./figures/Venn_Diagrams/all_barres/*.png
* run ./jupyter_notebooks/mouse.celltype-expressed_protein-coding_genes_w_dNdS.ipynb
    * Generate ./results/mouse.celltype-expressed_genes/protein-coding_w_dNdS/*/*.tsv
* run ./jupyter_notebooks/mouse.celltype-expressed.stats_and_figures.ipynb
    * Generate ./results/celltype-expressed_descriptive_stats.xlsx
	* and ./results/celltype-expressed_inferential_stats.xlsx
    * Visualize ./figures/MannWhitney/mouse_reference_genome/*.celltype-expressed.pdf
	* and ./figures/mouse.celltype-expressed.boxplots.pdf
