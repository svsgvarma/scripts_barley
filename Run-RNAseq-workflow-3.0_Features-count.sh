#!/bin/bash


#Separate reads
##############################################################################################################

#./Run-RNAseq-workflow-3.0_Features-count.sh > Run-RNAseq-workflow-3.0_Features-count.sh.log 2>&1

echo "run script for rna-seq-analysis"

######################
work_dir=/home/gala0002/proj/proj_Aakash/

express="/bioinfo/express-1.5.1-linux_x86_64/express"


mkdir -p ${work_dir}P17565_3.0_Salmon_Genome/
out_dir=${work_dir}P17565_3.0_Salmon_Genome/

in_dir=${work_dir}P17565_2.0_Align-STAR_Genome/

cd ${in_dir}

for nbr in `ls $in_dir`
do

nbr1=$(echo $nbr | sed 's=/[^/]*$==;s/\.$//')
mkdir -p ${out_dir}${nbr}/

temp_dir=${out_dir}${nbr}/
cd ${temp_dir}

#All-reads
echo "Processing sample: ${in_dir}${nbr}/${nbr1}"

######## #Salmon #####
#https://salmon.readthedocs.io/en/latest/salmon.html
#conda create -n salmon salmon

conda activate salmon
##
<<COMMENT
#######################################################
cat Hordeum_vulgare.IBSC_v2.cds.all.fa | sed 's/>HORV/>transcript:HORV/g' | sed 's/>AGP/>transcript:AGP/g' | sed 's/>BAV/>transcript:BAV/g' > Hordeum_vulgare.IBSC_v2.cds.all_rname.fa

COMMENT

##
Ref_trans="/home/gala0002/proj/proj_Aakash/REF/Hordeum_vulgare.IBSC_v2/Hordeum_vulgare.IBSC_v2.cds.all_rname.fa"

echo "Processing sample ${i}"
salmon quant -t ${Ref_trans} -p 60 -l A \
-a ${in_dir}${nbr}/${nbr1}-sort-trim-STARAligned.toTranscriptome.out.bam \
-o ${out_dir}${nbr1}/salmon

conda deactivate



done

############

echo "Script done all...."



