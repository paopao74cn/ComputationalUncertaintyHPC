if [ -z ${base_dir} ]; then
	export base_dir=`pwd`
fi
#export job_type="64-6-10Mpc-z0"
#export job_type="32-8-10Mpc-z0"
export job_type="32-7-10Mpc-z0"
#export job_type="16-9-10Mpc-z0"
export script_dir="${base_dir}/scripts"

export compiler_vendor="gcc"
#export compiler_version="4.8.1"

#export compiler="${compiler_vendor}@${compiler_version}"
export compiler="${compiler_vendor}"
export optimization_level="high"
export mpi_version="1.10.2"
