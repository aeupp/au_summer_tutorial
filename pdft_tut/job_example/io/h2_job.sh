#!/bin/bash
#SBATCH -A awasser  ##### which node on bell to use? use slist to check what you have available
#SBATCH -t 01-0:00:00  #### the time limit for your job | can see max walltime with slist
#SBATCH -N 1  ### 1 | number of CPUs to use
#SBATCH -n 4  ### | number of cores to use
#SBATCH --job-name=h2_test ### job name
#SBATCH --output=test.dat ### where to write the output
#SBATCH --error=error_test.dat ### where to write errors encounterd

#### the env that yuming recently installed with psi4 and pyscf.

module use /depot/awasser/etc/modules_psi4_1.8_pyscf_2.3.0/
module load conda-env/psi4_1.8_pyscf_2.3.0-py3.8.5
# can check which modules are avaiable with module avail

# Run the Python script
# submit the job as: 'sbatch h2_job.sh'
# can see your job in queue with 'squeue -u username'
# can use 'watch squeue -u username' to watch the progress of job
python -u h2.py 
