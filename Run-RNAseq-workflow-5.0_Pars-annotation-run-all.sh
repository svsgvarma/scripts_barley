#!/bin/bash


#Pars DEG

echo "run script "

#./Run-RNAseq-workflow-5.0_Pars-annotation-run-all.sh > Run-RNAseq-workflow-5.0_Pars-annotation-DEG_CDS-DEseq2_all_Murilo.log 2>&1


###############################################
#all samples with stCuSTr-D_tr
#########

#python2.7 Run-RNAseq-workflow-5.0_Pars-annotation-DEG_CDS-DEseq2_stCuSTr-D_tr.py C0_vs_P2.P.DESeq2.DE_results.P5e-2_C0.DE.subset C0_vs_P2.P.DESeq2.DE_results.P5e-2_C0.DE.subset_anno.tsv /home/gala0002/proj/proj_Sophie-Laura/DESeq2_genes_stCuSTr-D_tr_C0/

workdir="/home/gala0002/proj/proj_Aakash/"

###

for i in 155 155x199 199 199x155 199x235 224x155 224x199 235 244
do
echo ${i}

python2.7 Run-RNAseq-workflow-5.1_Pars-annotation.py ${i}"-T1_vs_${i}-T2.DESeq2.DE_results.P5e-2_C0.DE.subset" ${i}"-T1_vs_${i}-T2.DESeq2.DE_results.P5e-2_C0.DE.subset_anno.tsv" ${workdir}"DESeq2_genes_${i}/"
#python2.7 Run-RNAseq-workflow-5.1_Pars-annotation.py ${i}"_vs_${ij}.DESeq2.DE_results" ${i}"_vs_${ij}.DESeq2.DE_results_anno.tsv" ${workdir}"DESeq2_genes_stCuSTr-D_tr_A.DH/"

done

###############################################

echo "Script done...."



###############################################
# Intersection of two time points 

#cat 155-T1_vs_155-T2.DESeq2.DE_results.P5e-2_C0.DE.subset | cut -f1  | grep "HOR" | wc -l

cat DESeq2_genes_*/*.DESeq2.DE_results.P5e-2_C0.DE.subset | cut -f1  | grep "HOR" | sort -u > P17565_4.0_Intersect/DESeq2.DE_results.P5e-2_C0.DE_Intersect.subset


cat DESeq2_genes_*/*.DESeq2.DE_results.P5e-2_C0*T1-UP.subset | cut -f1  | grep "HOR" | sort -u > P17565_4.0_Intersect/DESeq2.DE_results.P5e-2_C0.DE_Intersect-T1-UP.subset

cat DESeq2_genes_*/*.DESeq2.DE_results.P5e-2_C0*T2-UP.subset | cut -f1  | grep "HOR" | sort -u > P17565_4.0_Intersect/DESeq2.DE_results.P5e-2_C0.DE_Intersect-T2-UP.subset



########

cat DESeq2_genes_*/*.DESeq2.DE_results.P5e-2_C0.DE.subset | cut -f1  | grep "HOR" | sort | uniq -c | sort


cat DESeq2_genes_*/*.DESeq2.DE_results.P5e-2_C0*T1-UP.subset | cut -f1  | grep "HOR" | sort | uniq -c | sort 

cat DESeq2_genes_*/*.DESeq2.DE_results.P5e-2_C0*T2-UP.subset | cut -f1  | grep "HOR" | sort | uniq -c | sort 


####
cat DESeq2_genes_*/*.DESeq2.DE_results.P5e-2_C0.DE.subset | grep "HORVU6Hr1G093470.1"



cat DESeq2_genes_*/*.DESeq2.DE_results.P5e-2_C0.DE.subset | cut -f1  | grep "HOR" | grep "HORVU6Hr1G093470.1"

grep -f inter_652.txt ../DESeq2_genes_*/*.DESeq2.DE_results.P5e-2_C0.DE.subset_anno.tsv -w

