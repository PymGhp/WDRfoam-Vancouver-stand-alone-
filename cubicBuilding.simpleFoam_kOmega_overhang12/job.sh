#!/bin/bash
        
#SBATCH --account=def-huage
#SBATCH --time=1-23:50
#SBATCH --mem-per-cpu=8000M
#SBATCH --mail-user=payam.gholamalipour@mail.concordia.ca
#SBATCH --mail-type=BEGIN
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8

## Load Modules
module load nixpkgs/16.09  gcc/7.3.0  openmpi/3.1.4  openfoam/7
source $FOAM_BASH

## Decompose mesh
decomposePar -force 

## Run the parallel job
export PATH=$PATH:/home/payamghp/scratch/cubicBuilding.simpleFoam_kOmega_overhang12
srun simpleFoam -parallel 

