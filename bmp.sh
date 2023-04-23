#!/bin/bash
#SBATCH --job-name=bmp2
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --time=96:00:00
#SBATCH --cpus-per-task=8
#SBATCH --ntasks-per-node=1
#SBATCH --mem=30g
#SBATCH --output=/shared/Project_3_Resources/GroupAZJ/O_E/%Bmp2.out
#SBATCH --error=/shared/Project_3_Resources/GroupAZJ/O_E/%Bmp2.err

# These steps are required to activate Conda
source $HOME/.bash_profile
conda activate /shared/apps/conda/bio

python3 /shared/Project_3_Resources/GroupAZJ/Outputs/TEMP/sian_bpm.py -i /shared/Project_3_Resources/GroupAZJ/Outputs/TEMP/LAB_Vs_NEN.concat.txt -o /shared/Project_3_Resources/GroupAZJ/Outputs/TEMP/ -prefix LAB_Vs_NEN_15 -ws 1000 -ms 15 -np 2

python3 /shared/Project_3_Resources/GroupAZJ/Outputs/TEMP/sian_bpm.py -i /shared/Project_3_Resources/GroupAZJ/Outputs/TEMP/LAB_Vs_ODN.concat.txt -o /shared/Project_3_Resources/GroupAZJ/Outputs/TEMP/ -prefix LAB_Vs_ODN_15 -ws 1000 -ms 15 -np 2



