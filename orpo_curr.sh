#!/bin/bash
#SBATCH --job-name=orpo_curr
#SBATCH --partition=superpod-a100
#SBATCH --exclusive
#SBATCH --gres=gpu:8
#SBATCH --mem=80GB
#SBATCH --time=12:00:00
#SBATCH -d singleton
#SBATCH --nodes=1
#SBATCH --open-mode truncate
#SBATCH -o /work/pi_miyyer_umass_edu/ctpham/alignment-handbook/orpo_curr.out
#SBATCH --mail-type=end
#SBATCH --constraint=a100-80g 
#SBATCH --mail-user=ctpham@umass.edu
#SBATCH --nodelist=gpu[018-024]

# Loading modules
module load cuda/11.8.0
source ~/.bashrc
source ~/alignment/bin/activate
module load python/3.11.0
python3 --version
pip3 show torch

# Running ORPO
ACCELERATE_LOG_LEVEL=info accelerate launch --config_file /work/pi_miyyer_umass_edu/ctpham/alignment-handbook/recipes/accelerate_configs/deepspeed_zero3.yaml /work/pi_miyyer_umass_edu/ctpham/alignment-handbook/scripts/run_orpo.py /work/pi_miyyer_umass_edu/ctpham/alignment-handbook/recipes/zephyr-7b-beta/orpo/orpo_curr.yaml