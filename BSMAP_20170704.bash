#!/bin/bash
####################################################################
#
#A (quite) simple submit script for a one or tow processor job
#
####################################################################
#
# SGE options
#
#Change to the current working directory upon starting of the job
#$ -cwd
#
source ~/.bashrc
# Specify the kind of shell script you use, for example, bash
#$ -S /bin/bash
#
# join the error and standard output streams
#$ -j y
#
#
# don't flood myself with e-mail
#$ -m e
#
# this is my e-mail address
#$ -M zihailing@live.cn
#
#where the format error go
#$ -e /home/hlzi/infor 
#where the format output go
#$ -o /home/hlzi/infor
# notify me about pending SIG_STOP and SIG_KILL
#$ -notify
#
### export the default option
#name of the job
# -N BS_bsmap 
# Specify the array start ,end , step
#$ -t 1-16:1 
# end of SGE stuff
#########################################################
# now execute my job:

ARRAY=( head HMZ0029_2899 HMZ0029_2900 HMZ0029_2901 HMZ0029_2902 HMZ0029_2903 HMZ0029_2904  HMZ0029-2905 HMZ0029-2906 HMZ0029-2907 HMZ0029-2908 HMZ0029-2909 HMZ0029-2910 HMZ0029-2911 HMZ0029-2912 HMZ0029-2913 HMZ0029-2914)
DIR=/home/hlzi/project/HMZ_20170704_methylation
TMPD=$DIR/BSMAP_result
DATA=$DIR/tmp_data
SRC=/psc/home/hlzi/personaldata/BSMAP_analysis_pipeline/need/
REF=/psc/home/hlzi/personaldata/species_20151012/Ath/Ensemble_36/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa
 
#mkdir -p $TMPD/${ARRAY[$SGE_TASK_ID]}
#/home/hlzi/tools/bsmap-2.90/bsmap -a $DATA/${ARRAY[$SGE_TASK_ID]}/Len_sort_step_4/*paired1 -b $DATA/${ARRAY[$SGE_TASK_ID]}/Len_sort_step_4/*.paired2 -d $REF -o $TMPD/${ARRAY[$SGE_TASK_ID]}_bsmap.bsp  -v 2 -p 24 -S 1 2>$TMPD/.${ARRAY[$SGE_TASK_ID]}_1

#python /home/hlzi/tools/bsmap-2.90/methratio.py  -r -z -p -d $REF -m 1 $TMPD/${ARRAY[$SGE_TASK_ID]}_bsmap.bsp -o $TMPD/${ARRAY[$SGE_TASK_ID]}_bsmap_report.txt -w $TMPD/${ARRAY[$SGE_TASK_ID]}.wig 2> $TMPD/.${ARRAY[$SGE_TASK_ID]}_2
#perl $SRC/methyratio_report_to_bed_file.pl $TMPD/${ARRAY[$SGE_TASK_ID]}_bsmap_report.txt > $TMPD/${ARRAY[$SGE_TASK_ID]}_methy.bed.original
#awk 'BEGIN{OFS="\t"};$4~/CHH/{print $1,$2-1,$2,$5}' $TMPD/${ARRAY[$SGE_TASK_ID]}_bsmap_report.txt >$TMPD/${ARRAY[$SGE_TASK_ID]}_CHH.bed
#awk 'BEGIN{OFS="\t"};$4~/CHG/{print $1,$2-1,$2,$5}' $TMPD/${ARRAY[$SGE_TASK_ID]}_bsmap_report.txt >$TMPD/${ARRAY[$SGE_TASK_ID]}_CHG.bed
#awk 'BEGIN{OFS="\t"};$4~/CG/{print $1,$2-1,$2,$5}' $TMPD/${ARRAY[$SGE_TASK_ID]}_bsmap_report.txt >$TMPD/${ARRAY[$SGE_TASK_ID]}_CG.bed
#awk 'BEGIN{OFS="\t"};NR>1{print $1,$2-1,$2,$5}' $TMPD/${ARRAY[$SGE_TASK_ID]}_bsmap_report.txt >$TMPD/${ARRAY[$SGE_TASK_ID]}.bed

#perl $SRC/Cytosine_bed_acgt_out.pl $TMPD/${ARRAY[$SGE_TASK_ID]}_methy.bed.original $TMPD ${ARRAY[$SGE_TASK_ID]}
#perl $SRC/Cytosine_bed_acgt_out_step2.pl $TMPD/${ARRAY[$SGE_TASK_ID]}_rev.txt /home/hlzi/personaldata/species_20151012/Ath/BG_forw.txt > $TMPD/${ARRAY[$SGE_TASK_ID]}_rev.txt.temp
#mv $TMPD/${ARRAY[$SGE_TASK_ID]}_rev.txt.temp $TMPD/${ARRAY[$SGE_TASK_ID]}_rev.txt
#perl $SRC/Cytosine_bed_acgt_out_step2.pl $TMPD/${ARRAY[$SGE_TASK_ID]}_forw.txt /home/hlzi/personaldata/species_20151012/Ath/BG_forw.txt > $TMPD/${ARRAY[$SGE_TASK_ID]}_forw.txt.temp
#mv $TMPD/${ARRAY[$SGE_TASK_ID]}_forw.txt.temp $TMPD/${ARRAY[$SGE_TASK_ID]}_forw.txt


#perl $SRC/cal_cytosines_coverage_for_acgt_count_output_v0.1.pl $TMPD ${ARRAY[$SGE_TASK_ID]} $RE
#perl  $SRC/filter_original_bed.pl $TMPD/${ARRAY[$SGE_TASK_ID]}_methy.bed.original > $TMPD/${ARRAY[$SGE_TASK_ID]}_methy.bed
#/home/hlzi/tools/Python-3.5.2/python $SRC/mcall_format_change.py $TMPD/${ARRAY[$SGE_TASK_ID]}_methy.bed  > $TMPD/${ARRAY[$SGE_TASK_ID]}_CX.bed

cd $TMPD
intersectBed -a  ${ARRAY[$SGE_TASK_ID]}_methy.bed -b /home/hlzi/personaldata/species_20151012/Ath/Ensemble_36/Arabidopsis_thaliana.TAIR10.36.gene.bed -wa -wb |sort -k5,5 -k12,12 |groupBy  -g 5,12 -c 7,8 -o sum,sum|awk '{OFS="\t";print $2,$1,$3,$4}' |perl $SRC/add_CX_groupBy.pl >  ${ARRAY[$SGE_TASK_ID]}_gene_ML.out
intersectBed -a  ${ARRAY[$SGE_TASK_ID]}_methy.bed -b /home/hlzi/personaldata/species_20151012/Ath/Ensemble_36/Arabidopsis_thaliana.TAIR10.36.gene.up2K.bed -wa -wb |sort -k5,5 -k12,12 |groupBy  -g 5,12 -c 7,8 -o sum,sum|awk '{OFS="\t";print $2,$1,$3,$4}' |perl $SRC/add_CX_groupBy.pl >  ${ARRAY[$SGE_TASK_ID]}_gene_up2k_ML.out
intersectBed -a  ${ARRAY[$SGE_TASK_ID]}_methy.bed -b /home/hlzi/personaldata/species_20151012/Ath/Ensemble_36/Arabidopsis_thaliana.TAIR10.36.gene.down2K.bed -wa -wb |sort -k5,5 -k12,12 |groupBy  -g 5,12 -c 7,8 -o sum,sum|awk '{OFS="\t";print $2,$1,$3,$4}' |perl $SRC/add_CX_groupBy.pl >  ${ARRAY[$SGE_TASK_ID]}_gene_down2k_ML.out
