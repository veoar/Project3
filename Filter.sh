#!/bin/bash
#SBATCH --job-name=filter2
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --time=96:00:00
#SBATCH --cpus-per-task=8
#SBATCH --ntasks-per-node=1
#SBATCH --mem=30g
#SBATCH --output=/shared/Project_3_Resources/GroupAZJ/O_E/%Filter2.out
#SBATCH --error=/shared/Project_3_Resources/GroupAZJ/O_E/%Filter2.err

# These steps are required to activate Conda
source $HOME/.bash_profile
conda activate /shared/apps/conda/bio


gatk SelectVariants \
        -R /shared/Project_3_Resources/GroupAZJ/Data/Data/C_excelsa_V5.fa \
        -V /shared/Project_3_Resources/GroupAZJ/Data/Data/LAB_NEN_ODN.clean_BI.ann.vcf.gz \
        -sn LAB_004 -sn LAB_1 -sn LAB_2 -sn LAB_300 -sn LAB_4 -sn LAB_400 -sn LAB_5 -sn LAB_500 \
        --exclude-filtered \
        --select "AF > 0 && AF < 1" \
        -O /shared/Project_3_Resources/GroupAZJ/Outputs/TEMP/LAB.vcf

gatk SelectVariants \
        -R /shared/Project_3_Resources/GroupAZJ/Data/Data/C_excelsa_V5.fa \
        -V /shared/Project_3_Resources/GroupAZJ/Data/Data/LAB_NEN_ODN.clean_BI.ann.vcf.gz \
        -sn NEN_001 -sn NEN_003 -sn NEN_200 -sn NEN_300 -sn NEN_4 -sn NEN_5 -sn NEN_6 \
        --exclude-filtered \
        --select "AF > 0 && AF < 1" \
        -O /shared/Project_3_Resources/GroupAZJ/Outputs/TEMP/NEN.vcf

gatk SelectVariants \
        -R /shared/Project_3_Resources/GroupAZJ/Data/Data/C_excelsa_V5.fa \
        -V /shared/Project_3_Resources/GroupAZJ/Data/Data/LAB_NEN_ODN.clean_BI.ann.vcf.gz \
        -sn ODN_10 -sn ODN_2 -sn ODN_4 -sn ODN_5 -sn ODN_6 -sn ODN_7 -sn ODN_9 \
        --exclude-filtered \
        --select "AF > 0 && AF < 1" \
        -O /shared/Project_3_Resources/GroupAZJ/Outputs/TEMP/ODN.vcf
