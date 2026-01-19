#!/bin/bash
#PBS -W group_list=dp_immunoth -A dp_immunoth # LARS GROUP
#PBS -l nodes=1:ppn=32:thinnode
#PBS -l gpus=0
#PBS -l mem=128GB
#PBS -l walltime=70:00:00
#PBS -e /home/projects/dp_immunoth/people/helweg/projects/benchmarking/running_benchmark.err
#PBS -o /home/projects/dp_immunoth/people/helweg/projects/benchmarking/running_benchmark.log
#PBS -N running_benchmark

mkdir -p /home/people/helweg/.conda/pkgs
mkdir -p /home/people/helweg/.conda/envs
mkdir -p /home/people/helweg/tmp

export CONDA_PKGS_DIRS=/home/people/helweg/.conda/pkgs
export CONDA_ENVS_DIRS=/home/people/helweg/.conda/envs
export TMPDIR=/home/people/helweg/tmp
export CONDA_TEMP=/home/people/helweg/tmp
export PIP_CACHE_DIR=/home/people/helweg/.conda/pip
export CONDA_NO_PLUGINS=true

# SØREN SANDGAARD - WHICH MODULES TO LOAD?
module load tools 
module load conda_for_gatk/4.1.8.1
module load apptainer/1.4.0 
module load omnibenchmark/0.2.2 
module load anaconda3/2025.06-1

WD="/home/people/helweg/immu/people/helweg/projects/benchmarking/ob-pipeline-cytof"

cd "$WD"

ob run benchmark -b Clustering_conda.yml --cores 1 --local

