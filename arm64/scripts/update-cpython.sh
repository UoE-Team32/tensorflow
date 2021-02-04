
cd $PACKAGE_DIR
readonly package=python
readonly version=$PY_VERSION
readonly src_host=https://github.com/python
readonly src_repo=cpython

export CFLAGS="${BASE_CFLAGS} -O3"
export LDFLAGS="${BASE_LDFLAGS} -lpthread"
readonly confflags="" #"--enable-optimizations

install_dir=$PROD_DIR/$package/$version
cd $src_repo
rm -rf Build/*
cd Build

echo "config" >> /tmp/log.log
../configure $confflags # --prefix=$install_dir
make -j $NP_MAKE
make install


update-alternatives --install /usr/bin/python python /usr/local/bin/python3 1
update-alternatives --install /usr/bin/pip pip /usr/local/bin/pip3 1
