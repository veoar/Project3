#!/bin/bash
#SBATCH --job-name=Merge2
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --time=96:00:00
#SBATCH --cpus-per-task=8
#SBATCH --ntasks-per-node=1
#SBATCH --mem=30g
#SBATCH --output=/shared/Project_3_Resources/GroupAZJ/O_E/%Merge2.out
#SBATCH --error=/shared/Project_3_Resources/GroupAZJ/O_E/%Merge2.err

# These steps are required to activate Conda
source $HOME/.bash_profile
conda activate /shared/Project_3_Resources/GroupAZJ/NewPython

python3 /shared/Project_3_Resources/GroupAZJ/Outputs/TEMP/Sian_sort_for_ScanTools.py '/shared/Project_3_Resources/GroupAZJ/Outputs/TEMP/LAB.table.recode.txt /shared/Project_3_Resources/GroupAZJ/Outputs/TEMP/NEN.table.recode.txt' /shared/Project_3_Resources/GroupAZJ/Outputs/TEMP/ LAB_Vs_NEN

python3 /shared/Project_3_Resources/GroupAZJ/Outputs/TEMP/Sian_sort_for_ScanTools.py '/shared/Project_3_Resources/GroupAZJ/Outputs/TEMP/LAB.table.recode.txt /shared/Project_3_Resources/GroupAZJ/Outputs/TEMP/ODN.table.recode.txt' /shared/Project_3_Resources/GroupAZJ/Outputs/TEMP/ LAB_Vs_ODN

