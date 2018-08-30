# Stop if an error is encountered
set -e

source scripts/base_vars.sh

for i in {0..1}; do
	export job_num=${i}
	echo "working on job ${job_num}.."
	# Copy initial conditions to job directory
	if [ ! -e "${i}" ]; then
		cp -r Init ${i}
	fi;

	cd ${i}
	if [ ! -e "RunFinished" ]; then
		# Run cosmology simulation
		echo "Run cosmology simulation"
		bash ${base_dir}/scripts/run_sim.sh
	fi;
	if [ ! -e ${base_dir}/output/rockstar/rockstar_catalog_${job_num}_${slice} ]; then
		# Run halo finding and gas plotting
		echo "Run halo finding and gas plotting"
		bash ${base_dir}/scripts/run_sim_analysis.sh
	fi;
	cd ..
done;

echo "Run superhalo finding"
bash ${base_dir}/scripts/run_superhalo_analysis.sh
