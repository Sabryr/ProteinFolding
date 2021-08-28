#!/bin/bash

# Job name:
#SBATCH --job-name=RoseTTAFold
#SBATCH --account=XXXX
#SBATCH --time=10:10:00
#SBATCH --nodes=1
#SBATCH --ntasks=96
#SBATCH --mem=1000G
#SBATCH --partition=accel --gpus=4


## Set up job environment:
set -o errexit  # Exit the script on any error
set -o nounset  # Treat any unset variables as an error

module purge
module load RoseTTAFold/1.0.0.2

run_pyrosetta_fox.sh query.fasta .
predict_complex.py -i t000_.msa0.a3m -o complex -Ls 218 310 
