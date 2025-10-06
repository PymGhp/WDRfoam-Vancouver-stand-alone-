#!/bin/bash
        
#SBATCH --account=def-huage
#SBATCH --time=0-23:50
#SBATCH --mem-per-cpu=8000M
#SBATCH --mail-user=payam.gholamalipour@mail.concordia.ca
#SBATCH --mail-type=BEGIN
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8

## Load Modules
module load nixpkgs/16.09  gcc/7.3.0  openmpi/3.1.4  openfoam/7
source $FOAM_BASH


## Run the job
export PATH=$PATH:/home/payamghp/OpenFOAM/payamghp-7/winddrivenrainfoam-of-org_v7.0
changeDictionary

## Decompose mesh
decomposePar -force 

## Run the job
srun windDrivenRainFoam -parallel 


## reconstructing mesh
reconstructPar 


