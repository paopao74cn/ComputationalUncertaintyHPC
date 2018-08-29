# ComputationalUncertaintyHPC
This repo is associated with experiments done on NCSA's Blue Waters system to improve our understanding of computational uncertainty and reproducibility.
* Due to the non-deterministic nature of this experimental procedure, we expect scientists attempting to replicate this work will only replicate to one or two significant digits for each experiment. These experiments were carried out during the later half of 2016 and so a researcher attempting to replicate this work on Blue Waters may find specific versions of compilers we used (and even Blue Waters itself) unavailable in the future.
* [gif displaying experimental output](http://stanford.edu/~vcs/animated.gif)

## Software

We present here a list of software which was used to perform the cosmology simulations along with the software to analyze the output.

### Cosmology Simulation

- Enzo 2.5
- HDF5 1.8 (We tested with 1.8.16 and 1.8.20)
 - HDF5 must also have shared libraries and mpi compatibility enabled.
- MPI implementation
 - We had trouble building our software stack with openmpi. In the end, we went with MPICH 3.2 or a MPICH 3 compiled for the machine in question.

- zlib 1.2.11 (Other 1.2 versions of zlib should be okay too.

The Spack package spec for enzo on a recent Arch Linux machine is: 

```
spack find -d -v enzo
==> 1 installed packages.
-- linux-archrolling-x86_64 / gcc@8.1.1 -------------------------
    enzo@2.5~bitwise~bluewaters~cray mode=debug patches=c473271a7c7d14f5ca71c1be58a7d78c71156282e7d62519861782cc8100eb9c,fac46ec62d9dcc4aaf3808c39d7ce7f4a84d983e18f2d0f5f52f129ef5a42380
        ^hdf5@1.8.20~cxx~debug~fortran~hl+mpi+pic+shared~szip~threadsafe
            ^mpich@3.2.1 device=ch3 +hydra netmod=tcp +pmi+romio~verbs
            ^zlib@1.2.11+optimize+pic+shared
```

### Analysis Toolchain

- Yt 3.4.1 (We also used 3.3.5)
- libconfig 1.5
- Python libconf 1.0.1

The Spack package spec for the various toolchain libraries is:

```
spack find -d -v py-yt                                                                                  
==> 1 installed packages.
-- linux-archrolling-x86_64 / gcc@8.1.1 -------------------------
    py-yt@3.4.1+astropy+h5py+rockstar+scipy
        ^py-astropy@1.1.2
            ^cfitsio@3.450+bzip2+shared
                ^bzip2@1.0.6+shared
            ^expat@2.2.5+libbsd
                ^libbsd@0.8.6
            ^libxml2@2.9.8~python
                ^xz@5.2.4
                ^zlib@1.2.11+optimize+pic+shared
            ^py-beautifulsoup4@4.5.3
                ^python@2.7.15+dbm~optimizations patches=123082ab3483ded78e86d7c809e98a804b3465b4683c96bd79a2fd799f572244 +pic+pythoncmd+shared~tk+ucs4
                    ^gdbm@1.14.1
                        ^readline@7.0
                            ^ncurses@6.1~symlinks~termlib
                    ^openssl@1.0.2o+systemcerts
                    ^sqlite@3.23.1~functions
            ^py-h5py@2.7.1+mpi
                ^hdf5@1.10.2~cxx~debug~fortran+hl+mpi patches=57cee5ff1992b4098eda079815c36fc2da9b10e00a9056df054f2384c4fc7523 +pic+shared~szip~threadsafe
                    ^openmpi@3.1.1~cuda+cxx_exceptions fabrics= ~java~memchecker~pmi schedulers= ~sqlite3~thread_multiple+vt
                        ^hwloc@1.11.9~cairo~cuda+libxml2+pci+shared
                            ^libpciaccess@0.13.5
                            ^numactl@2.0.11 patches=592f30f7f5f757dfc239ad0ffd39a9a048487ad803c26b419e0f96b8cda08c1a
                ^py-mpi4py@3.0.0
                ^py-numpy@1.12.0+blas+lapack
                    ^openblas@0.3.2 cpu_target= ~ilp64 patches=47cfa7a952ac7b2e4632c73ae199d69fb54490627b66a62c681e21019c4ddc9d +pic+shared threads=none ~virtual_machine
                ^py-six@1.11.0
            ^py-markupsafe@1.0
            ^py-matplotlib@2.2.3~animation+image~ipython~latex~qt+tk
                ^freetype@2.9.1
                    ^libpng@1.6.34
                ^py-backports-functools-lru-cache@1.5
                ^py-cycler@0.10.0
                ^py-dateutil@2.5.2
                ^py-functools32@3.2.3-2
                ^py-kiwisolver@1.0.1
                ^py-pillow@5.1.0~freetype+jpeg~jpeg2000~lcms~tiff+zlib
                    ^libjpeg-turbo@1.5.90
                ^py-pyparsing@2.2.0
                ^py-pytz@2017.2
                ^py-setuptools@25.2.0
                ^py-subprocess32@3.2.7
                ^qhull@2015.2 build_type=RelWithDebInfo patches=10ddc62a1600b0ede23fb0502e29dca389d18689fd8dfe7a849e3a989c0e607e
                ^tk@8.6.8
                    ^libx11@1.6.5
                        ^kbproto@1.0.7
                        ^libxcb@1.13
                            ^libpthread-stubs@0.4
                            ^libxau@1.0.8
                                ^xproto@7.0.31
                            ^libxdmcp@1.1.2
                        ^xextproto@7.3.0
                    ^tcl@8.6.8
            ^py-pandas@0.21.1
                ^py-bottleneck@1.0.0
                ^py-numexpr@2.6.5
            ^py-pyyaml@3.11
            ^py-scikit-image@0.12.3
                ^py-dask@0.17.4+array+bag+dataframe+delayed
                    ^py-cloudpickle@0.5.2
                    ^py-partd@0.3.8
                        ^py-locket@0.2.0
                        ^py-toolz@0.9.0
                ^py-networkx@1.11
                    ^py-decorator@4.0.9
                ^py-scipy@1.1.0
        ^py-cython@0.28.3
        ^py-ipython@5.1.0
            ^py-backports-shutil-get-terminal-size@1.0.0
            ^py-pathlib2@2.1.0
            ^py-pexpect@4.2.1
                ^py-ptyprocess@0.5.1
            ^py-pickleshare@0.7.4
            ^py-prompt-toolkit@1.0.9
                ^py-wcwidth@0.1.7
            ^py-pygments@2.2.0
            ^py-simplegeneric@0.8.1
            ^py-traitlets@4.3.1
                ^py-enum34@1.1.6
                ^py-ipython-genutils@0.1.0
        ^py-sympy@1.1.1
            ^py-mpmath@1.0.0
        ^rockstar@yt~hdf5 patches=4a7edd21e5798c454203c75afa51e699ef20786b6119d2984cd7d805a3f9ef3d,b6adb7547f156d6b07f3ba649f8554c9cfdcdad8109aeacbe8b6f8aaced1b797
```

```
spack find -d -v libconfig 
==> 1 installed packages.
-- linux-archrolling-x86_64 / gcc@8.1.1 -------------------------
    libconfig@1.5
```

```
spack find -d -v py-libconf
==> 1 installed packages.
-- linux-archrolling-x86_64 / gcc@8.1.1 -------------------------
    py-libconf@1.0.1
        ^python@2.7.15+dbm~optimizations patches=123082ab3483ded78e86d7c809e98a804b3465b4683c96bd79a2fd799f572244 +pic+pythoncmd+shared~tk+ucs4
            ^bzip2@1.0.6+shared
            ^gdbm@1.14.1
                ^readline@7.0
                    ^ncurses@6.1~symlinks~termlib
            ^openssl@1.0.2o+systemcerts
                ^zlib@1.2.11+optimize+pic+shared
            ^sqlite@3.23.1~functions
```
