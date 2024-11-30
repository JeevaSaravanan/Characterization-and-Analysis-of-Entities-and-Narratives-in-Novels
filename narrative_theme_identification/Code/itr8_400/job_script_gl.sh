#!/bin/bash --login
# Job name:
#SBATCH --job-name=gl_8

# Number of tasks (processes)
# SLURM defaults to 1 but we specify anyway
#SBATCH --ntasks=1

# Type and number of GPUs
# The type is optional.
#SBATCH --gpus=v100:1

# Memory per node
# Specify "M" or "G" for MB and GB respectively
#SBATCH --mem=64G

# Wall time
# Format: "minutes", "hours:minutes:seconds", 
# "days-hours", or "days-hours:minutes"
#SBATCH --time=1:00:00

# Mail type
# e.g., which events trigger email notifications
#SBATCH --mail-type=ALL

# Mail address
#SBATCH --mail-user=lellaom@msu.edu

# Standard output and error to file
# %x: job name, %j: job ID
#SBATCH --output=%x-%j.SLURMout

#SBATCH --output=gl_8.out
#SBATCH --error=gl_8.err

export CONDA3PATH=/mnt/scratch/lellaom/anaconda3
conda activate venv

# Run our job
cd /mnt/scratch/lellaom/narrative_theme_identification/code/itr8_400
srun python generate_labels.py

# Print resource information
scontrol show job $SLURM_JOB_ID
js -j $SLURM_JOB_ID