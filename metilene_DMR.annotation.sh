#!/bin/sh
for i in metilene_DMR/metilene_DMR_Col-0 metilene_DMR/metilene_DMR_ddm1 metilene_DMR/metilene_DMR_ibm1-1 metilene_DMR/metilene_DMR_mock_Col-0_ddm1 metilene_DMR/metilene_DMR_mock_Col-0_ibm1-1 metilene_DMR/metilene_DMR_mock_Col-0_rdd2 metilene_DMR/metilene_DMR_treat_Col-0_ddm1 metilene_DMR/metilene_DMR_treat_Col-0_ibm1-1 metilene_DMR/metilene_DMR_treat_Col-0_rdd2 
do
	awk '$4<0.05' ${i}|sort -V -k1,1 -k2,2n >aa
	intersectBed -a HMZ0029_2899_methy.bed -b aa -wa -wb |sort -k9,9 -k 10,10 -k11,11 -k5,5 >bb
	/share/apps/prog/bedtools/bin/groupBy  -g 9,10,11,5,12,13,14,15,16,17,18  -c  5  -o count -i bb >cc
	/share/apps/prog/bedtools/bin/groupBy  -g 1,2,3,5,6,7,8,9,10,11 -c 4,12  -o collapse,collapse -i cc >${i}.bed
	rm aa bb cc
done
