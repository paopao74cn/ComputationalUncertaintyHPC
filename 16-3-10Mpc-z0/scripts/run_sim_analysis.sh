set -e
source ${base_dir}/scripts/analysis_env.sh

mpirun -n 3 python ${analysis_dir}/rockstar_find_halos.py -d ${data_root_directory} -o ${output_root_directory} -n ${job_num} -s ${slice}
mpirun -n 3 python ${analysis_dir}/post_halo_finding_analysis.py -d ${data_root_directory} -o ${output_root_directory} -n ${job_num} -s ${slice}
python ${analysis_dir}/halo_projection_plots.py -d ${data_root_directory} -o ${output_root_directory} -n ${job_num} -s ${slice}
