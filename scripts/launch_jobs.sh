#!/bin/bash

# Get number of jobs
if [ $# -lt 1 ]; then
	echo "You need to pass the number of jobs."
	exit 1
fi;

num="$1"

#User input validation
case ${num} in
	''|*[!0-9]*) echo "You must pass a number as the first argument."; exit 2;;
	*) ;;
esac

source scripts/base-vars.sh

job=0
while [ ${job} -lt ${num} ]; do
	job_dir="${base_dir}/jobs/${job}"

	if [ ! -e "${job_dir}/RunFinished" ]; then
		cd "${job_dir}"
		echo "Submitting job ${job_num}..."
		qsub -N "${job_type}_${compiler_vendor}_${compiler_version}_${optimization_level}_${job_num}" -v "base_dir=${base_dir}" -d ${job_dir} ${base_dir}/scripts/job.pbs
	fi;

	job=$(expr ${job} + 1)
done;
