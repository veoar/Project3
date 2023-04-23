#!/bin/bash
#SBATCH --job-name=Script2
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --time=96:00:00
#SBATCH --cpus-per-task=8
#SBATCH --ntasks-per-node=1
#SBATCH --mem=30g
#SBATCH --output=/shared/Project_3_Resources/GroupAZJ/O_E/script2.out
#SBATCH --error=/shared/Project_3_Resources/GroupAZJ/O_E/script2.err

# These steps are required to activate Conda
source $HOME/.bash_profile
conda activate /shared/apps/conda/bio

gatk VariantsToTable \
        -V /shared/Project_3_Resources/GroupAZJ/Outputs/TEMP/LAB.vcf \
        -R /shared/Project_3_Resources/GroupAZJ/Data/Data/C_excelsa_V5.fa \
        -F CHROM -F POS -F AC -F AN -F DP -GF GT \
        -O /shared/Project_3_Resources/GroupAZJ/Outputs/TEMP/LAB.table

gatk VariantsToTable \
        -V /shared/Project_3_Resources/GroupAZJ/Outputs/TEMP/NEN.vcf \
        -R /shared/Project_3_Resources/GroupAZJ/Data/Data/C_excelsa_V5.fa \
        -F CHROM -F POS -F AC -F AN -F DP -GF GT \
        -O /shared/Project_3_Resources/GroupAZJ/Outputs/TEMP/NEN.table

gatk VariantsToTable \
        -V /shared/Project_3_Resources/GroupAZJ/Outputs/TEMP/ODN.vcf \
        -R /shared/Project_3_Resources/GroupAZJ/Data/Data/C_excelsa_V5.fa \
        -F CHROM -F POS -F AC -F AN -F DP -GF GT \
        -O /shared/Project_3_Resources/GroupAZJ/Outputs/TEMP/ODN.table
