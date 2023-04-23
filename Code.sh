#!/bin/bash
#SBATCH --job-name=Recode2
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --time=96:00:00
#SBATCH --cpus-per-task=8
#SBATCH --ntasks-per-node=1
#SBATCH --mem=30g
#SBATCH --output=/shared/Project_3_Resources/GroupAZJ/O_E/Recode2.out
#SBATCH --error=/shared/Project_3_Resources/GroupAZJ/O_E/Recode2.err

# These steps are required to activate Conda
source $HOME/.bash_profile
conda activate /shared/Project_3_Resources/GroupAZJ/NewPython

python3 /shared/Project_3_Resources/GroupAZJ/Outputs/TEMP/recode012.py -i /shared/Project_3_Resources/GroupAZJ/Outputs/TEMP/LAB.table -o /shared/Project_3_Resources/GroupAZJ/Outputs/TEMP/ -pop LAB

python3 /shared/Project_3_Resources/GroupAZJ/Outputs/TEMP/recode012.py -i /shared/Project_3_Resources/GroupAZJ/Outputs/TEMP/NEN.table -o /shared/Project_3_Resources/GroupAZJ/Outputs/TEMP/ -pop NEN

python3 /shared/Project_3_Resources/GroupAZJ/Outputs/TEMP/recode012.py -i /shared/Project_3_Resources/GroupAZJ/Outputs/TEMP/ODN.table -o /shared/Project_3_Resources/GroupAZJ/Outputs/TEMP/ -pop ODN

