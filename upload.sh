#!/bin/bash
#SBATCH --job-name=upload
#SBATCH --partition=cpu-long
#SBATCH --mem=80GB
#SBATCH --time=24:00:00
#SBATCH -d singleton
#SBATCH --nodes=1
#SBATCH --open-mode truncate
#SBATCH -o /work/pi_miyyer_umass_edu/ctpham/alignment-handbook/upload.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=ctpham@umass.edu

source /home/ctpham_umass_edu/alignment/bin/activate
huggingface-cli upload chtmp223/mistral-7b-sft-full /work/pi_miyyer_umass_edu/ctpham/alignment-handbook/data/full-finetuned-mistral-7b .