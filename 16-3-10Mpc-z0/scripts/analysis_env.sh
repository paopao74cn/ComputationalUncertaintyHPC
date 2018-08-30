set -e
source ~/slow-data/Software/spack/spack-yt-rockstar-Aug-2018/share/spack/setup-env.sh
source <(spack module tcl loads --dependencies py-yt)
source <(spack module tcl loads --dependencies libconfig)
source <(spack module tcl loads --dependencies py-libconf)
