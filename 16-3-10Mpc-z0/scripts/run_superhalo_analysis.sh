set -e
source ${base_dir}/scripts/analysis_env.sh

echo ${analysis_dir}

python ${analysis_dir}/save_halo_data.py -d ${data_root_directory} -o ${output_root_directory} -s ${slice} --sim-numbers {0..1}
python ${analysis_dir}/superhalo_finding.py -j 4 -d ${data_root_directory} -o ${output_root_directory} -s ${slice} --sim-numbers {0..1}
${analysis_dir}/superhalo_finding -s ./output/rockstar/rockstar_catalog_*_RD0011/halos.cfg -o output/superhalos/superhalos.conf
python ${analysis_dir}/superhalo_info_plotting.py -d ${data_root_directory} -o ${output_root_directory}
