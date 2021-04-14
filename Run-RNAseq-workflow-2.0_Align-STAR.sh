#!/bin/bash


#Rna-seq using STAR
#./Run-RNAseq-workflow-2.0_Align-STAR.sh > Run-RNAseq-workflow-2.0_Align-STAR.sh.log 2>&1


echo "run script for rna-seq-analysis"
##########################################
#STAR-Aligner
##########################################

#make REF index
<<COMMENT


##########
#http://malooflab.phytonetworks.org/wiki/bioinformatics/

ref=/home/gala0002/proj/proj_Aakash/REF/Hordeum_vulgare.IBSC_v2/

nice -n 5 STAR --runMode genomeGenerate \
--genomeDir ${ref} \
--genomeFastaFiles ${ref}Hordeum_vulgare.IBSC_v2.dna.toplevel.fa \
--sjdbGTFfile ${ref}Hordeum_vulgare.IBSC_v2.49.gff3 \
--runThreadN 60 \
--sjdbGTFtagExonParentTranscript Parent \
--sjdbGTFfeatureExon CDS \
--genomeSAindexNbases 12 \
--limitGenomeGenerateRAM 300000000000

##########

COMMENT

ulimit -n 65535
ulimit -c unlimited

#Make STAR alignment
######################
work_dir=/home/gala0002/proj/proj_Aakash/
#ref=/home/gala0002/proj/proj_Sophie-Laura/REF/Sequence_Solyntus_v1.1/
ref=/home/gala0002/proj/proj_Aakash/REF/Hordeum_vulgare.IBSC_v2/

#mkdir -p ${work_dir}P15505_2.0_Align-STAR_Solyntus_v1.1_Trans_unmap/
#out_dir=${work_dir}P15505_2.0_Align-STAR_Solyntus_v1.1_Trans_unmap/

#mkdir -p ${work_dir}P15505_2.0_Align-STAR_PGSC_v4.03_Trans_unmap/
#out_dir=${work_dir}P15505_2.0_Align-STAR_PGSC_v4.03_Trans_unmap/

mkdir -p ${work_dir}P17565_2.0_Align-STAR_Genome/
out_dir=${work_dir}P17565_2.0_Align-STAR_Genome/


######################################################
#####---STAR with 2 Lanes:  P16061
######################################################

cd ${work_dir}P17565_1.0_sort-trim/

#for nbr in Sample_484-10-1/; do
#for nbr in Sample*/; do

for nbr in `ls /home/gala0002/proj/proj_Aakash/P17565_1.0_sort-trim/`

do
echo "Sample_DIR: $nbr"/

#nbr1=$(echo $nbr | sed 's=/[^/]*$==;s/\.$//')
nbr1=$(echo $nbr | cut -d"-" -f1)

echo $nbr1
#echo $nbr2

mkdir -p ${out_dir}${nbr1}/

temp_dir=${out_dir}${nbr1}/
cd ${temp_dir}

#All-reads
echo "Processing sample: ${nbr1}"

#5.2.2) Make START alignment

nice -n 5 STAR --genomeDir ${ref} \
--readFilesIn ${work_dir}P17565_1.0_sort-trim/${nbr}"/"${nbr1}-sort-trim_1.fq.gz ${work_dir}P17565_1.0_sort-trim/${nbr}"/"${nbr1}-sort-trim_2.fq.gz \
--sjdbGTFfile ${ref}Hordeum_vulgare.IBSC_v2.49.gff3 \
--outFileNamePrefix ${temp_dir}${nbr1}-sort-trim-STAR \
--outSAMtype BAM SortedByCoordinate \
--quantMode TranscriptomeSAM GeneCounts \
--twopassMode Basic \
--alignIntronMax 15000 \
--outFilterIntronMotifs RemoveNoncanonical \
--runThreadN 60 \
--sjdbGTFtagExonParentTranscript Parent \
--sjdbGTFfeatureExon CDS \
--outReadsUnmapped Fastx \
--readFilesCommand zcat


<<COMMENT

nice -n 5 samtools sort -n ${temp_dir}${nbr1}-sort-trim-STARAligned.toTranscriptome.out.bam -o ${temp_dir}${nbr1}-sort-trim-STARAligned.toTranscriptome_sort.bam -@ 65

rm ${temp_dir}${nbr1}-sort-trim-STARAligned.sortedByCoord.out.bam
rm ${temp_dir}${nbr1}-sort-trim-STARLog.out
rm ${temp_dir}${nbr1}-sort-trim-STARLog.progress.out
rm ${temp_dir}${nbr1}-sort-trim-STARSJ.out.tab
rm -fr ${temp_dir}${nbr1}-sort-trim-STAR_STARgenome/
rm -fr ${temp_dir}${nbr1}-sort-trim-STAR_STARpass1/

#####
rm -fr P*/*-sort-trim-STAR_STARgenome/
rm -fr P*/*-sort-trim-STAR_STARpass1/

rm P*/*-sort-trim-STARLog.progress.out
rm P*/*-sort-trim-STARSJ.out.tab
rm P*/*-sort-trim-STARReadsPerGene.out.tab
rm P*/*-sort-trim-STARLog.out

rm P*/*-sort-trim-STARAligned.sortedByCoord.out.bam

#rm P*/*-sort-trim-STARUnmapped.out.mate*


COMMENT



done


echo "Done for independent samples..."


echo "Script done...."

