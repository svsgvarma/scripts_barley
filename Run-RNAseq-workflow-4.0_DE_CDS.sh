#!/bin/bash


#Rna-seq using STAR
#./Run-RNAseq-workflow-4.0_DE_CDS_PGSC_v4.03.sh > Run-RNAseq-workflow-4.0_DE_CDS_PGSC_v4.03.sh.log 2>&1


echo "run script for rna-seq-analysis"

############################################
# 2.2. Identifying differentially expressed (DE) transcripts
############################################
#Extracting differentially expressed transcripts and generating heatmaps

Trinity="/data/bioinfo/trinityrnaseq-Trinity-v2.6.5/Trinity"
Trinity_path="/data/bioinfo/trinityrnaseq-Trinity-v2.6.5"
work_dir=/home/gala0002/proj/proj_Aakash/
#ref=/home/gala0002/proj/proj_Ramesh/Ref_Nicotiana_benthamiana/

cd $work_dir

############################################
#Build Transcript and Gene Expression Matrices
#https://github.com/trinityrnaseq/trinityrnaseq/wiki/Trinity-Transcript-Quantification#express-output
# perl $Trinity_path/util/align_and_estimate_abundance.pl \
# --transcripts Trinity.fasta \
# --seqType fq \
# --samples_file Metadata_CDS_Mock-PMTVWT-delta8k_merge.txt \
# --est_method salmon \
# --trinity_mode --prep_reference \
# --output_dir outdir_estimate-ab > estimate-ab.log 2>&1
	
############################################
#Run the DE analysis at the gene level

#DESeq2
#for i in C0 C6 C12 C24 C48 C0.M24M C6.M24M C12.M24M C24.M24M C48.M24M
# QC6 QC12 QC24 QC48 QC0.M24M QC6.M24M QC12.M24M QC24.M24M QC48.M24M


for i in 155 155x199 199 199x155 199x235 224x155 224x199 235 244

#for i in 155
do 

echo ${i}

mkdir -p ${work_dir}"DESeq2_genes_"${i}

cd $work_dir

$Trinity_path/Analysis/DifferentialExpression/run_DE_analysis.pl \
--matrix Express_counts_allsamp_rename.matrix \
--samples_file Sample-list-Barley-project_${i}.txt \
--method DESeq2 \
--output DESeq2_genes_${i} > DGE-run_${i}.log 2>&1

#Extracting differentially expressed transcripts and generating heatmaps
#Extract those differentially expressed (DE) transcripts that are at least 4-fold (C is set to 2^(2) ) differentially expressed at a significance of <= 0.001 (-P 1e-3) in any of the pairwise sample comparisons
#-C 1.0

cd DESeq2_genes_${i}/
nice -n 5 $Trinity_path/Analysis/DifferentialExpression/analyze_diff_expr.pl \
--matrix ../Express_counts_allsamp_rename.matrix \
--samples ../Sample-list-Barley-project_${i}.txt -P 5e-2 -C 0 > DGE-analyze_${i}.log 2>&1

rename 's/Express_counts_allsamp_rename.matrix.//' *

#rm *_vs_P*

rm diffExpr.P5e-2_C0.matrix.RData


done


####


############################################

echo "Script done...."


