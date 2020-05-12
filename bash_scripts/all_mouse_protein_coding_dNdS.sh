#!/bin/bash

while read SPECIES
do
	wget -O ../results/Ensembl98_mouse/mouse_protein_coding_genes.${SPECIES}.txt "http://www.ensembl.org/biomart/martservice?query=<?xml version=\"1.0\" encoding=\"UTF-8\"?><Query  virtualSchemaName = \"default\" formatter = \"TSV\" header = \"0\" uniqueRows = \"0\" count = \"\" datasetConfigVersion = \"0.6\" ><Dataset name = \"mmusculus_gene_ensembl\" interface = \"default\" ><Filter name = \"biotype\" value = \"protein_coding\"/><Attribute name = \"ensembl_gene_id\" /><Attribute name = \"external_gene_name\" /><Attribute name = \"description\" /><Attribute name = \"${SPECIES}_homolog_orthology_type\" /><Attribute name = \"${SPECIES}_homolog_subtype\" /><Attribute name = \"${SPECIES}_homolog_dn\" /><Attribute name = \"${SPECIES}_homolog_ds\" /><Attribute name = \"${SPECIES}_homolog_orthology_confidence\" /></Dataset></Query>"
done < ../data/against_mouse.speciesID_full_list.txt