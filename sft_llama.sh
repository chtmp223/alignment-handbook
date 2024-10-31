#!/bin/bash
#SBATCH --job-name=sft_llama
#SBATCH --partition=superpod-a100
#SBATCH --exclusive
#SBATCH --gres=gpu:8
#SBATCH --mem=80GB
#SBATCH --time=72:00:00
#SBATCH -d singleton
#SBATCH --nodes=2
#SBATCH --open-mode truncate
#SBATCH -o /work/pi_miyyer_umass_edu/ctpham/alignment-handbook/sft_llama.out
#SBATCH --mail-type=ALL
#SBATCH --constraint=a100-80g 
#SBATCH --mail-user=ctpham@umass.edu
#SBATCH --nodelist=gpu[018-024]

module load cuda/11.8.0
source ~/.bashrc
source test/bin/activate
module load python/3.11.0
ACCELERATE_LOG_LEVEL=info accelerate launch --config_file recipes/accelerate_configs/deepspeed_zero3_llama.yaml scripts/run_sft.py recipes/zephyr-7b-beta/sft/llama.yaml
