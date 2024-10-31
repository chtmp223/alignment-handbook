#!/bin/bash
# Script to prepare the environment for orpo
#SBATCH --job-name=install
#SBATCH --partition=cpu-preempt
#SBATCH --mem=80GB
#SBATCH --time=1:00:00
#SBATCH -d singleton
#SBATCH --open-mode truncate
#SBATCH -o /work/pi_miyyer_umass_edu/ctpham/alignment-handbook/install.out
#SBATCH --mail-type=end
#SBATCH --mail-user=ctpham@umass.edu


module load cuda/11.8.0
source ~/.bashrc
source ~/alignment/bin/activate
module load python/3.11.0
python3 --version
pip3 install torch==2.1.2
cd /work/pi_miyyer_umass_edu/ctpham/
cd alignment-handbook/
python3 -m pip install .
cd ..
cd trl/
pip3 install .
