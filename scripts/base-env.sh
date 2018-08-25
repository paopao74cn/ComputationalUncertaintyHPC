if [ -z ${base_dir} ]; then
source scripts/base-vars.sh
source scripts/setup-spack.sh
else
source ${base_dir}/scripts/base-vars.sh
source ${base_dir}/scripts/setup-spack.sh
fi;
