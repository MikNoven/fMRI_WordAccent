#!/bin/bash
#Input is regular fMRI.

#DATA_DIR='/Users/ling-men/Documents/MRData/7T018'
DATA_DIR='/Volumes/WordAccentData/1718_7T018';
cd $DATA_DIR
N=6

#subj=1010
while read subj; do
    for run in `seq 1 2`; do
    	((i=i%N)); ((i++==0)) && wait
		cp WA_fMRI_first.fsf WA_fMRI_first_tmp${subj}${run}.fsf
		sed -i.tmp "s/RUNNBR/${run}/" WA_fMRI_first_tmp${subj}${run}.fsf 
		sed -i.tmp "s/SUBJ/${subj}/" WA_fMRI_first_tmp${subj}${run}.fsf 
		sed -i.tmp "s/SUBJ/${subj}/" WA_fMRI_first_tmp${subj}${run}.fsf 
		feat WA_fMRI_first_tmp${subj}${run}.fsf &
	done
done <$DATA_DIR/subjlist_GERall.txt
sem --wait
#rm *_tmp*.fsf*
