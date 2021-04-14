#!/usr/bin/python

"""
#Script to Pars vcf...

#####------Inputs-------
# Run-RNA-workflow-7.0_Pars-annotation-DEG.py INPUT=Inputfile OUTPUT=Outputfile DIR=Directory-fullpath

#python2.7 Run-RNAseq-workflow-5.1_Pars-annotation.py 224x155-T1_vs_224x155-T2.DESeq2.DE_results.P5e-2_C0.DE.subset 224x155-T1_vs_224x155-T2.DESeq2.DE_results.P5e-2_C0.DE.subset_anno.tsv /home/gala0002/proj/proj_Aakash/DESeq2_genes_224x155/

#############################################------
cat PGSC_DM_V403_genes.gff | awk -F"\t" '{if($3 == "mRNA" ) print $0 }' > PGSC_DM_V403_mRNA.gff

####------

"""
import sys
import re
import os
import tempfile
import commands
import subprocess
#import subprocess32
from subprocess import *
from subprocess import call

"""
#Query_ID, Subject_ID, %Identity, Alignment_length, Mismatches, Gap_opens, Q.start, Q.end, S.start, S.end, E-value, Bit-score
#Query_ID	Subject_ID	%Identity	Alignment_length	Mismatches	Gap_opens	Q.start	Q.end	S.start	S.end	E-value	Bit-score
"""


class fileHandler:
	def __init__(self):
		self.data = []
		#print "Calling fileHandler constructor"
	def open_file(self,readfl):
		self.rfile = open(readfl,'r').readlines()
		return self.rfile
	def write_file(self,writefl):
		self.wfile = open(writefl,'w')
		return self.wfile

class SearchDB(fileHandler):

	def __init__(self):
		self.data = []
		from collections import defaultdict
		self.ident_ranges_HMBM = defaultdict(list)

	def Search_ReMM(self,readfl1,outfl1,workdir):
		"""
		Calling Search local DB
		"""
		def srchdb1(GName1):
			DIR="/home/gala0002/proj/proj_Aakash/REF/Hordeum_vulgare.IBSC_v2/Hordeum_vulgare.IBSC_v2.cds.all_header"
			try:
				True
				cmdFls1 = "LANG=C grep -m 1 -w '"+str(GName1)+"' "+str(DIR)+""
				cmdFls2 =  subprocess.check_output(cmdFls1, shell=True)
				grepout1 = str("\t".join(cmdFls2.strip().split("\t")))
			except:
				False
				grepout1 = str(".")
			return grepout1

		"""
		def srchdb2(GName1):
			DIR="/home/gala0002/proj/proj_Sophie-Laura/REF/PGSC_v4.03/PGSC_DM_V403_mRNA.gff"
			try:
				True
				cmdFls1 = "LANG=C grep -m 1 -w '"+str(GName1)+"' "+str(DIR)+""
				cmdFls2 =  subprocess.check_output(cmdFls1, shell=True)
				grepout1 = str("\t".join(cmdFls2.strip().split("\t")))
			except:
				False
				grepout1 = str("."+"\t"+"."+"\t"+"."+"\t"+"."+"\t"+"."+"\t"+"."+"\t"+"."+"\t"+"."+"\t"+".")
			return grepout1

		def srchdb3(GName1):
			DIR="/home/gala0002/proj/proj_Sophie-Laura/REF/Ref_Sotub_itag.v1/itag_function_descriptions.txt"
			try:
				True
				cmdFls1 = "LANG=C grep -m 1 -w '"+str(GName1)+"' "+str(DIR)+""
				cmdFls2 =  subprocess.check_output(cmdFls1, shell=True)
				grepout1 = str("\t".join(cmdFls2.strip().split("\t")[2:]))
			except:
				False
				grepout1 = str(".")
			return grepout1
		"""

		with open(workdir+readfl1,'r') as f1, open(workdir+outfl1,'w') as output:
			first_line0 = f1.readline().strip().split("\t")
			first_lines = f1.readlines()
			anno_Hordeum_vulgare = "Hordeum_vulgare.IBSC_v2_Gene-Description"
			output.write(str("TransID"+"\t"+str("\t".join(first_line0))+"\t"+str("chromosome	gene	gene_biotype")+"\t"+anno_Hordeum_vulgare+"\n"))

			for lns in first_lines:
				lns_sp =  lns.strip().split("\t")
				lns_sp1 =  lns_sp[0]
				Anno_out1 = srchdb1(lns_sp1)
				Anno_out2 = Anno_out1.split(" ")
				list2 =[]
				for j in Anno_out2[2:5]:
					list2.append(str(":".join(j.split(":")[1:])))
				out_print = str("\t".join(lns_sp)+"\t"+str("\t".join(list2))+"\t"+str(" ".join(Anno_out2[6:])))
				output.write(out_print+"\n")

		print "Done seach for ..."
		return None

clF1 = SearchDB().Search_ReMM(sys.argv[1],sys.argv[2],sys.argv[3])

