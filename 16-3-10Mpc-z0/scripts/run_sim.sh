set -e
source ${base_dir}/scripts/enzo_env.sh

mpirun -n 8 enzo gas_plus_dm_amr_multiphys.enzo >& log.txt
