set -e
source ~/slow-data/Software/spack/spack-yt-rockstar-Aug-2018/share/spack/setup-env.sh
source <(spack module tcl loads --dependencies "enzo@2.5 mode=aggressive")
