#!/bin/bash
#SBATCH --job-name=handbook_lora
#SBATCH --partition=gpu-preempt
#SBATCH --nodes=1
#SBATCH --mem=450G
#SBATCH --time=48:00:00
#SBATCH --gres=gpu:a100:6
#SBATCH --constraint=a100-80g
#SBATCH --output=/work/pi_miyyer_umass_edu/ctpham/alignment-handbook/.logs/llama_lora_%j.out
#SBATCH --open-mode=truncate
#SBATCH --mail-type=ALL
#SBATCH --mail-user=ctpham@cs.umass.edu

source ~/.bashrc
module load cuda/11.8.0
conda activate handbook
ACCELERATE_LOG_LEVEL=info accelerate launch --config_file recipes/accelerate_configs/deepspeed_zero3.yaml --num_processes=4 scripts/run_sft.py recipes/llama/sft/config_qlora.yaml --load_in_4bit=false --report_to=wandb