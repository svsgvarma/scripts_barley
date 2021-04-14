#!/bin/bash -l


echo "run script for rna-seq-analysis Cleaning and QC"

#./Run-RNAseq-workflow-1.1_Merge_QC.sh > Run-RNAseq-workflow-1.1_Merge_QC.sh.log 2>&1

#1. Raw Data QC Assessment

work_dir=/home/gala0002/proj/proj_Aakash/

#mkdir -p ${work_dir}P8403_1.2_trim_Merge/
#out_dir1=${work_dir}P8403_1.2_trim_Merge/

mkdir -p ${work_dir}P17565_1.1_sort-trim_FastQC/
out_dir1=${work_dir}P17565_1.1_sort-trim_FastQC/

mkdir -p ${work_dir}P17565_1.2_sort-trim_MultiQC/
out_dir2=${work_dir}P17565_1.2_sort-trim_MultiQC/


cd ${work_dir}


for f in `ls /home/gala0002/proj/proj_Aakash/P17565_1.0_sort-trim/P17565_*/*-trim_1.fq.gz`; do

DIR=$(dirname $f)
BASEFL=$(basename $f )
BASEFL_CP=$(basename $f | cut -d_ -f1,2 )
SID=$(basename $f | cut -d- -f1 )

#$TRIMMOMATIC/adapters/
#NexteraPE-PE.fa , TruSeq3-PE-2.fa

echo "Dir_ID:" ${DIR}
echo "Sample_filepath:" ${BASEFL}
echo "Sample_ID_trim:" ${BASEFL_CP}
echo "SID:" ${SID}

#mkdir -p ${out_dir1}${SID}
#temp_dir=${out_dir1}${SID}"/"


####
#Command to run fastqc 
nice -n 5 find ${DIR} -name '*.gz' | xargs fastqc -o ${out_dir1} -t 40


done


####
# Command to run multiqc on FastQC files

conda activate py3.7

multiqc ${out_dir1} -o ${out_dir2}

conda deactivate

####

echo "Done script..."

