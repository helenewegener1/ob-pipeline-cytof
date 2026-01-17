#!/bin/bash
#PBS -W group_list=dp_immunoth -A dp_immunoth # LARS GROUP
#PBS -l nodes=1:ppn=64:thinnode
#PBS -l gpus=0
#PBS -l mem=128GB
#PBS -l walltime=70:00:00
#PBS -e /home/projects/dp_immunoth/people/helweg/projects/benchmarking/running_benchmark.err
#PBS -o /home/projects/dp_immunoth/people/helweg/projects/benchmarking/running_benchmark.log
#PBS -N running_benchmark

# SØREN SANDGAARD - WHICH MODULES TO LOAD?
module load tools 
module load conda_for_gatk/4.1.8.1
module load apptainer/1.4.0 
module load omnibenchmark/0.2.2 
module load anaconda3/2025.06-1

WD="/home/people/helweg/immu/people/helweg/projects/benchmarking/ob-pipeline-cytof"

cd "$WD"

ob run benchmark -b Clustering_conda.yml --cores 1 --local

