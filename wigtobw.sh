#/bin/sh
for i in `ls *smap_report.txt|cut -d '.' -f 1`
do
	perl wig_bsmap.pl ${i}.txt >wig_dir_transformed/${i}.wig
	~/tools/wigToBigWig wig_dir_transformed/${i}.wig chrom.sizes wig_dir_transformed/${i}.bw
done
