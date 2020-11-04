#!/bin/bash
rm ../results/MGI_organs/MGI_ID-tissue_type.tsv
touch ../results/MGI_organs/MGI_ID-tissue_type.tsv
rm ../results/MGI_organs/MGI_ID_list.txt
touch ../results/MGI_organs/MGI_ID_list.txt

for file in ../data/MGI_organs/*-specific.txt
do
	tissue=$(echo ${file} | cut -c 20- | rev | cut -c 14- | rev)
	#echo ${tissue}
	awk -v var=${tissue} 'NR>1{print $1,var}' OFS='\t' ${file} >> ../results/MGI_organs/MGI_ID-tissue_type.tsv
done
awk '{print $1}' ../results/MGI_organs/MGI_ID-tissue_type.tsv > ../results/MGI_organs/MGI_ID_list.txt
