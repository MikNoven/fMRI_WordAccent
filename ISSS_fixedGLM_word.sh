#!/bin/bash
# Script for fixing GLM and applying the film_gls
DATADIR='/Volumes/WordAccentData/1718_7T018'

N=6
cd $DATADIR
#Turn into for loop over subjects
#while read SUBJ; do
#for SUBJ in 1003 1012_2 1018; do
#SUBJ=1003
#for SUBJ in 1012_2 1018; do
while read SUBJ; do
	mystring="matlab -nodisplay -r \"addpath('/Users/ling-men/Documents/MATLAB/7T018/SparsefMRI/'); fixGLMmodel_ISSS_word_1718('${SUBJ}'); exit;\""
	eval $mystring 
	
	for RUNNBR in `seq 1 2`; do
	((i=i%N)); ((i++==0)) && wait
		#cp ${DATADIR}/${SUBJ}/${SUBJ}_fMRI_${RUNNBR}_first_ultrafinal.feat/design.con ${DATADIR}/${SUBJ}/ISSSdesignfin_${RUNNBR}.con
		film_gls --in=${DATADIR}/${SUBJ}/${SUBJ}_fMRI_${RUNNBR}_preproc_ultrafinal.feat/filtered_func_data.nii.gz --pd=${DATADIR}/${SUBJ}/${SUBJ}_ISSSdesignWordfin_${RUNNBR}.mat --con=${DATADIR}/${SUBJ}/${SUBJ}_ISSSdesignWordfin_${RUNNBR}.con --rn=${DATADIR}/${SUBJ}/Ordaccent_ISSS_word_8mm_${RUNNBR} &
	done
done<$DATADIR/subjlist_GERall.txt
sem --wait
#done <$DATADIR/subjlist_sw<e.txt

while read SUBJ; do
	for run in `seq 1 2`; do
		((i=i%N)); ((i++==0)) && wait
		
		mkdir ${DATADIR}/${SUBJ}/Ordaccent_ISSS_word_8mm_${run}/stats
		mv ${DATADIR}/${SUBJ}/Ordaccent_ISSS_word_8mm_${run}/*.nii.gz ${DATADIR}/${SUBJ}/Ordaccent_ISSS_word_8mm_${run}/stats/
		mv ${DATADIR}/${SUBJ}/Ordaccent_ISSS_word_8mm_${run}/dof ${DATADIR}/${SUBJ}/Ordaccent_ISSS_word_8mm_${run}/stats/dof
		mv ${DATADIR}/${SUBJ}/Ordaccent_ISSS_word_8mm_${run}/logfile ${DATADIR}/${SUBJ}/Ordaccent_ISSS_word_8mm_${run}/stats/logfile
		cp ${DATADIR}/${SUBJ}/${SUBJ}_fMRI_${run}_first_uberultrafinal.feat/stats/smoothness ${DATADIR}/${SUBJ}/Ordaccent_ISSS_word_8mm_${run}/stats/smoothness
		cp -R ${DATADIR}/${SUBJ}/${SUBJ}_fMRI_${run}_first_uberultrafinal.feat/reg ${DATADIR}/${SUBJ}/Ordaccent_ISSS_word_8mm_${run}/
		#cp -R ${DATADIR}/${SUBJ}/${SUBJ}_fMRI_${run}_first_final.feat/reg_standard ${DATADIR}/${SUBJ}/Ordaccent_ISSS_${run}/
		#updatefeatreg ${DATADIR}/${SUBJ}/Ordaccent_ISSS_8mm_${run} 
		done
		#/usr/local/fsl/bin/melodic -i ${DATADIR}/${SUBJ}/${SUBJ}_fMRI_${run}_preproc_ultrafinal.feat/filtered_func_data -o filtered_func_data.ica -v --nobet --bgthreshold=1 --tr=1.900002 -d 0 --mmthresh=0.5 --report --guireport=${DATADIR}/${SUBJ}/Ordaccent_ISSS_8mm_${run}/report.html &	done
done<$DATADIR/subjlist_GERall.txt
sem --wait

while read subj; do
   	((i=i%N)); ((i++==0)) && wait
   		updatefeatreg ${DATADIR}/${subj}/Ordaccent_ISSS_word_8mm_1
   		updatefeatreg ${DATADIR}/${subj}/Ordaccent_ISSS_word_8mm_2
   		cp ${DATADIR}/${subj}/${subj}_fMRI_1_first_uberultrafinal.feat/design.fsf ${DATADIR}/${subj}/Ordaccent_ISSS_word_8mm_1/
   		cp ${DATADIR}/${subj}/${subj}_fMRI_1_first_uberultrafinal.feat/mask.nii.gz ${DATADIR}/${subj}/Ordaccent_ISSS_word_8mm_1/
   		cp ${DATADIR}/${subj}/${subj}_fMRI_2_first_uberultrafinal.feat/design.fsf ${DATADIR}/${subj}/Ordaccent_ISSS_word_8mm_2/
   		cp ${DATADIR}/${subj}/${subj}_fMRI_2_first_uberultrafinal.feat/mask.nii.gz ${DATADIR}/${subj}/Ordaccent_ISSS_word_8mm_2/
		cp Ordaccent_word_8mm_second.fsf WA_fMRI_word_second_tmp${subj}.fsf
		sed -i.tmp "s/SUBJ/${subj}/" WA_fMRI_word_second_tmp${subj}.fsf 
		feat WA_fMRI_word_second_tmp${subj}.fsf &
done <${DATADIR}/subjlist_GERall.txt
sem --wait
#rm *_tmp*.fsf*