#!/bin/bash
#Input is regular fMRI.

#DATA_DIR='/Users/ling-men/Documents/MRData/7T018'
DATA_DIR='/Volumes/WordAccentData/1718_7T018';
cd $DATA_DIR
N=6

while read subj; do
    	((i=i%N)); ((i++==0)) && wait
		cp WA_fMRI_second.fsf WA_fMRI_second_tmp${subj}${run}.fsf
		sed -i.tmp "s/SUBJ/${subj}/" WA_fMRI_second_tmp${subj}${run}.fsf 
		sed -i.tmp "s/SUBJ/${subj}/" WA_fMRI_second_tmp${subj}${run}.fsf 
		feat WA_fMRI_second_tmp${subj}${run}.fsf &
done <$DATA_DIR/subjlist_SWE_II.txt
sem --wait
#rm *_tmp*.fsf*