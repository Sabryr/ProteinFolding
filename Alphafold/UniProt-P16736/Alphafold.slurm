#!/bin/bash

# Job name:
#SBATCH --job-name=P16736-ALPHAFOLD
#SBATCH --account=ec12
#SBATCH --time=10:10:00
#SBATCH --nodes=1
#SBATCH --ntasks=96
#SBATCH --mem=1000G
#SBATCH --partition=accel --gpus=4


## Set up job environment:
set -o errexit  # Exit the script on any error
set -o nounset  # Treat any unset variables as an error

module load Alphafold/2.0.0.1
#module load AlphaFold/2.0.0-fosscuda-2020b
#echo "Available GPUS:"
#python -c "from tensorflow.python.client import device_lib; print(device_lib.list_local_devices());"
#

ALPHAFOLD_DATA=/cluster/shared/databases/AlphaFold/full

run.sh -d $ALPHAFOLD_DATA  -o out -m model_1,model_2,model_3,model_4,model_5  -f query.fasta -t 2020-05-14
