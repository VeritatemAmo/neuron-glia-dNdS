#!/bin/bash
printf "name\tlength\tavg_phastCons\tcoverage\tstd\n" > ../results/cCREs/phastCons.strict_NonN.tsv
sed 1d ../results/cCREs/strict_NonN.tsv | while read name chr start end length
do
        avg_phastCons=$(bigWigSummary -type=mean ../data/mm10.60way.phastCons.bw $chr $start $end 1)
        coverage=$(bigWigSummary -type=coverage ../data/mm10.60way.phastCons.bw $chr $start $end 1)
        std=$(bigWigSummary -type=std ../data/mm10.60way.phastCons.bw $chr $start $end 1)
        printf "$name\t$length\t$avg_phastCons\t$coverage\t$std\n" >> ../results/cCREs/phastCons.strict_NonN.tsv
done 
