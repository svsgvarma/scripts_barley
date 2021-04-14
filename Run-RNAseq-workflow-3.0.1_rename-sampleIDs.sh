#!/bin/bash


#rename sampleIDs
##############################################################################################################

#
echo "run script for rna.seq.analysis"

####### rename dir ########

#mv P15505_101 0.A.1

mv P17565_201 244-T2-R3
mv P17565_202 244-T2-R2
mv P17565_203 244-T2-R1
mv P17565_104 155-T2-R3
mv P17565_105 235-T2-R3
mv P17565_106 235-T2-R1
mv P17565_107 224x155-T2-R3
mv P17565_108 224x155-T2-R2
mv P17565_109 224x155-T2-R1
mv P17565_110 155-T2-R1
mv P17565_204 224x199-T2-R1
mv P17565_112 224x199-T2-R2
mv P17565_113 199x155-T2-R1
mv P17565_114 199-T2-R2
mv P17565_115 199-T2-R3
mv P17565_116 155x199-T2-R2
mv P17565_117 199x155-T2-R3
mv P17565_118 155x199-T2-R3
mv P17565_205 224x199-T2-R3
mv P17565_120 155x199-T2-R1
mv P17565_121 199-T2-R1
mv P17565_122 155-T1-R1
mv P17565_123 199x235-T2-R3
mv P17565_124 224x155-T1-R1
mv P17565_125 155-T1-R3
mv P17565_126 199x235-T1-R2
mv P17565_127 199x235-T1-R1
mv P17565_128 199x235-T2-R1
mv P17565_129 224x155-T1-R2
mv P17565_130 155-T1-R2
mv P17565_131 199x235-T2-R2
mv P17565_132 199x235-T1-R3
mv P17565_133 224x155-T1-R3
mv P17565_134 199-T1-R1
mv P17565_135 155x199-T1-R3
mv P17565_136 224x199-T1-R1
mv P17565_137 199-T1-R3
mv P17565_138 235-T1-R2
mv P17565_139 199-T1-R2
mv P17565_140 155x199-T1-R2
mv P17565_141 155x199-T1-R1
mv P17565_142 224x199-T1-R3
mv P17565_143 235-T1-R1
mv P17565_144 235-T1-R3
mv P17565_145 224x199-T1-R2
mv P17565_146 199x155-T1-R1
mv P17565_147 199x155-T2-R2
mv P17565_148 199x155-T1-R2
mv P17565_149 244-T1-R2
mv P17565_150 155-T2-R2
mv P17565_151 244-T1-R1
mv P17565_152 235-T2-R2
mv P17565_153 199x155-T1-R3
mv P17565_206 244-T1-R3

#######


sed -i 's/P17565_201/244-T2-R3/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_202/244-T2-R2/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_203/244-T2-R1/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_104/155-T2-R3/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_105/235-T2-R3/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_106/235-T2-R1/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_107/224x155-T2-R3/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_108/224x155-T2-R2/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_109/224x155-T2-R1/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_110/155-T2-R1/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_204/224x199-T2-R1/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_112/224x199-T2-R2/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_113/199x155-T2-R1/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_114/199-T2-R2/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_115/199-T2-R3/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_116/155x199-T2-R2/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_117/199x155-T2-R3/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_118/155x199-T2-R3/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_205/224x199-T2-R3/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_120/155x199-T2-R1/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_121/199-T2-R1/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_122/155-T1-R1/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_123/199x235-T2-R3/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_124/224x155-T1-R1/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_125/155-T1-R3/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_126/199x235-T1-R2/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_127/199x235-T1-R1/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_128/199x235-T2-R1/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_129/224x155-T1-R2/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_130/155-T1-R2/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_131/199x235-T2-R2/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_132/199x235-T1-R3/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_133/224x155-T1-R3/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_134/199-T1-R1/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_135/155x199-T1-R3/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_136/224x199-T1-R1/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_137/199-T1-R3/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_138/235-T1-R2/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_139/199-T1-R2/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_140/155x199-T1-R2/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_141/155x199-T1-R1/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_142/224x199-T1-R3/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_143/235-T1-R1/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_144/235-T1-R3/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_145/224x199-T1-R2/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_146/199x155-T1-R1/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_147/199x155-T2-R2/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_148/199x155-T1-R2/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_149/244-T1-R2/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_150/155-T2-R2/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_151/244-T1-R1/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_152/235-T2-R2/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_153/199x155-T1-R3/g' Pars_STARlogfiles_rename.tsv
sed -i 's/P17565_206/244-T1-R3/g' Pars_STARlogfiles_rename.tsv

####### rename files ########
#find . -iname "*P15505_101*" -exec rename 's/P15505_101/0.A.1/' '{}' \;

####### 
#cp -r 24.M24M.2 24.M24M.3

##########################

echo "Script done all...."
