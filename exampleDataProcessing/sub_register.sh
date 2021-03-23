#!/bin/bash
#SBATCH --job-nam=register
#SBATCH -o /home/groups/rhiju/hannahw1/exampleDataProcessing/register.out
#SBATCH -p biochem
#SBATCH -n 1
#SBATCH --mail-user=hannahw1@stanford.edu
#SBATCH --mail-type=FAIL,END
#SBATCH --mem-per-cpu=30G
#SBATCH --cpus-per-task=6
#SBATCH --time=10:00:00


source ~/.bash_profile
source activate barcode_venv
cd /home/groups/rhiju/hannahw1/exampleDataProcessing
python /home/groups/rhiju/hannahw1/ARRAY_TOOLS_SCRIPTS/array_data_processing/getRegistrationOffsets.py -id example_registration_images/ -sd filtered_tiles/ -gv /home/groups/rhiju/hannahw1/ARRAY_TOOLS_SCRIPTS/
