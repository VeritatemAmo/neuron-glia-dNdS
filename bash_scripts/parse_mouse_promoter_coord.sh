#!/bin/bash
for file in ../results/mouse.celltype-specific_genes/protein-coding_w_dNdS/promoter.*.tsv
do
	sed '1d' ${file} | 
	split -l 1000 - "${file%*.tsv}"
done