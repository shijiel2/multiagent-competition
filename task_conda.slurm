#!/bin/bash
#SBATCH --job-name=task_cmae_conda_1
#SBATCH --output=task_cmae_conda_1.log
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=24
#SBATCH --time=00:10:00
#SBATCH --mem=64G
#SBATCH --partition=gpu-a100
# --partition=deeplearn shortgpgpu gpgpu gpu-a100
#SBATCH --gres=gpu:1
# SBATCH -q gpgpudeeplearn
# -q gpgpumse gpgpudeeplearn
#SBATCH -A punim1629
#SBATCH --mail-user=404notfxxkingfound@gmail.com
#SBATCH --mail-type=ALL


echo "Load module..."
module load gcccore/8.3.0
module load xvfb/1.20.8
module load x11/20190717
module load ffmpeg/4.2.1

module load anaconda3/2021.11
export CONDA_ENVS_PATH=/data/gpfs/projects/punim1629/anaconda3/envs

export MUJOCO_PY_MJKEY_PATH=/data/gpfs/projects/punim1629/shijie/adversarial-policies/mujoco_lin/mjkey.txt
export MUJOCO_PY_MJPRO_PATH=/data/gpfs/projects/punim1629/shijie/adversarial-policies/mujoco_lin/mjpro131

echo "Activate conda env..."
eval "$(conda shell.bash hook)"
conda activate rl_cmae

echo "Good to go!"
bash demo_tasks.sh you-shall-not-pass