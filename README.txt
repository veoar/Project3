# Project3
Project 3

#First step -> producing PCA.

#This was done using LIFE4136_adegent_sample_code.R
#Code given to us by Levi Yant.
#Changed lines 4 to set a working directory to my own working directory 
setwd("c:/Users/jordan/Documents/Projecct3")
#Changed lines 190 to read the selected VCF file
vcf <- read.vcfR("reheadered_4dg_dips.clean_BI.ann.vcf")   #read in all data
