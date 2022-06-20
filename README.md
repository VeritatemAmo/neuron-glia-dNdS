# neuron-glia-dNdS #

Contains the codes for analyzing dN/dS values of neuron-specific genes and glial cell-specific genes across mammalian species. 

## Software in bin ##

### bigWigSummary ###

Downloaded from http://hgdownload.soe.ucsc.edu/admin/exe/macOSX.x86_64/ on Nov 14, 2021

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
* run ./jupyter_notebooks/mouse.stats_and_figures.ipynb, calculate Mann Whitney stats for each pair of cell type for a couple of representative species as well as averaged dN/dS. Kruskal Wallis test was used for testing more than two cell types. Both annonical 0.05 p value threshold and a conservative 0.0001 p value threshold were used for visualizations. Figures with 0.0001 p value threshold were labeled with "conservative" in file name. 
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
    
#### Organ-specific genes ####
* run ./bash_scripts/mouse_organs.sh, merging organ-specific genes into a table 
    * Generate ./results/MGI_organs/MGI_ID-tissue_type.tsv and ./results/MGI_organs/MGI_ID_list.txt
* with ./results/MGI_organs/MGI_ID_list.txt, find Ensembl IDs of these genes
    * Generate ./results/MGI_organs/Ensembl_ID-MGI_ID.tsv
* run ./jupyter_notebooks/mouse.organs.ipynb to generate figures comparing neuron-specific genes dNdS with organ-specific genes
    * Generate ./figures/mouse.neuron_vs_organs.pdf and mouse.neuron_vs_organs_conservative.pdf
    * and ./figures/mouse.organs.pdf
    
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
    
#### Benchmark genes ####
* run ./jupyter_notebooks/benchmarks.ipynb __not cleaned up for github yet; check Herculano_Lab/Benchmark_Genes. For now use ./data/benchmarks.xlsx for analysis. Move that file to ./result once process is cleaned up and merged into Git.__

    
### Human Reference Genome ###

* run ./bash_scripts/all_human_protein_coding_dNdS.sh to download human genes' orthologs information from 92 mammalian species (including mouse). This include pattern of ortholog and dN and dS values. 
    * Generate ./results/Ensembl98_human/human_protein_coding_genes.*.txt
* run ./jupyter_notebooks/human.all_genes.ipynb to merge all 92 species together. 
	* Generate ./results/Ensembl98_human/human.92_species_dNdS.all_genes.tsv
	* and ./results/Ensembl98_human/human.dNdS_stats.all_genes.tsv
	* Visualize distribution of all genes' average dN/dS values, saved to ./figures/human.all_genes.*

### Chicken Reference Genome ###

* run ./bash_scripts/chicken_protein_coding_dNdS.sh to download dN values, dS values, etc of protein-coding genes from Ensembl.
	* Generate ./results/Ensembl98_chicken/chicken_protein_coding_genes.*.txt, One txt file for each of the 92 species with dN and dS values against mouse reference genome.

### Evolutionary Distance Between Each Species to the Species of Reference ### 

* run ./jupyter_notebooks/evo_distance.ipynb to look at the effect of evolutionary distance 
    * 
    
### PhastCons of Upstream Promoter Regions ###

* run ./jupyter_notebooks/mouse.gene_position.ipynb to get coordinates of 2,000 bp upstream 5' of each gene (for genes with ORF either + or - strand)
    * Generate ./results/mouse.celltype-specific_genes/protein-coding_w_dNdS/promoter.*.tsv, one for each brain celltype
    * and ./results/Ensembl100_mouse/promoter_position.tsv for all protein coding genes on mouse autosomes, sex chromosomes, and mitocondrial genes
    
* run ../bash_scripts/parse_mouse_promoter_coord.sh to further format list of promoter coordinates for UCSC Genome Browser, which does not take header nor more than 1000 lines at a time
    * Generate ./results/mouse.celltype-specific_genes/protein-coding_w_dNdS/promoter.*aa or ab if that celltype has more than a thousand promoters. 
    
* Use the coordinate to reterive phastCons stats from UCSC genome browser's table browser with GRCm38 mouse reference genome, with track phastCons60way (July 28th, 2020). Compile differenct cell types into an excel file by hand. 
    * Generate ./results/mouse.celltype-specific_genes/protein-coding_w_dNdS/phastCons/phastcons-celltype.xlsx
    
### Gene Overlap with Bayes et al., 2011 ###
* run ../jupyter_notebooks/Bayes_neuron_gene_venn.ipynb
	* get venn diagram between their neuronal genes (hPSD or non-hPSD) and my mouse neuron-specific genes
	* mostly non-overlapping 

### Single Cell Data ###
* run ../jupyter_notebooks/mouse_adult_brain.Saunders_2018_annotation.ipynb
* run ../jupyter_notebooks/mouse_adult_brain.Saunders_2018_Cell_Type.ipynb
* run ../jupyter_notebooks/exc_inh.mouse_adult_brain.Saunders_2018.ipynb
	* test whether excitatory and inhibitory neuron-specific genes are different in dN/dS values
* run ../jupyter_notebooks/neuron_subtypes.mouse_adult_brain.Saunders.ipynb
	* test whether the 500+ subclusters, aka detailed neuronal, glial, and vasculature cell types, are different in dN/dS
	* this is to test whether my original result that neuron-specific genes are low in dN/dS is due to these genes ubiquitously expressed across neuronal subtypes. 