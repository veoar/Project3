# Project3
Project 3

#First step -> producing PCA.

#This was done using LIFE4136_adegent_sample_code.R
#Code given to us by Levi Yant.
#Changed lines 4 to set a working directory to my own working directory 
setwd("c:/Users/jordan/Documents/Projecct3")
#Changed lines 190 to read the selected VCF file
vcf <- read.vcfR("reheadered_4dg_dips.clean_BI.ann.vcf")   #read in all data

#To run scantool:
#Have all the .sh scripts, the .py scripts and data in the same output directory
#Change the paths of the of the input and output directory if need be
#Run the .sh scripts in this order: 1-Filter.sh, 2-script.sh, 3-Code.sh, 4-Merge.sh, 5-bmp.sh/
#This should give you both LAB_Vs_NEN_15_BPM.txt and LAB_Vs_ODN_15_BPM.txt

#
