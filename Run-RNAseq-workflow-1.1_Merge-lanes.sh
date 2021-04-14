#!/bin/bash -l

echo "run script for rna-seq-analysis Cleaning and QC"

#./Run-RNA-workflow-1.2_Merge-lanes.sh > Run-RNA-workflow-1.2_Merge-lanes.sh.log 2>&1

#1. Raw Data QC Assessment
work_dir=/home/gala0002/proj/proj_Aakash/P17565_1.0_sort-trim/
cd ${work_dir}

##############--NG-14833_Reg_15dpa_2
#Command to Merge two lanes

for ii in 202 203 206 
do

echo ${ii}
SAMPout="P17565_"${ii}
mkdir -p ${work_dir}${SAMPout}/
out_dir1=${work_dir}${SAMPout}/

SAMP1="P17565_"${ii}"_AHGVMKDSXY"
SAMP2="P17565_"${ii}"_AHNKKTDSXY"

nice -n 5 gunzip -c ${work_dir}${SAMP1}/${SAMPout}-sort-trim_1.fq.gz > ${out_dir1}L1_1.fq
nice -n 5 gunzip -c ${work_dir}${SAMP1}/${SAMPout}-sort-trim_2.fq.gz > ${out_dir1}L1_2.fq

nice -n 5 gunzip -c ${work_dir}${SAMP2}/${SAMPout}-sort-trim_1.fq.gz > ${out_dir1}L2_1.fq
nice -n 5 gunzip -c ${work_dir}${SAMP2}/${SAMPout}-sort-trim_2.fq.gz > ${out_dir1}L2_2.fq

cat ${out_dir1}L1_1.fq ${out_dir1}L2_1.fq > ${out_dir1}${SAMPout}-sort-trim_1.fq
cat ${out_dir1}L1_2.fq ${out_dir1}L2_2.fq > ${out_dir1}${SAMPout}-sort-trim_2.fq

gzip ${out_dir1}${SAMPout}-sort-trim_1.fq
gzip ${out_dir1}${SAMPout}-sort-trim_2.fq
#Command to run fastqc
#nice -n 5 fastqc -o ${out_dir1} -t 15 --noextract ${out_dir1}Merge_1.fq ${out_dir1}Merge_2.fq

#remove temp files
rm ${out_dir1}L*_*.fq
#rm ${out_dir1}Merge_*.fq
##############

done
##############

echo "Done script..."


