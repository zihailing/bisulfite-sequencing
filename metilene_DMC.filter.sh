#!/bin/sh
for i in `ls metilene_DMC/* |grep -v 'filtered'`
do
	sort -V -k1,1 -k2,2n ${i}|awk '$9==0||$10==0||$9/$10<0.5||$9/$10>2' >${i}_filtered
done
