FROM linaro/tensorflow-arm-neoverse-n1:2.3.0-eigen

LABEL org.opencontainers.image.source=https://github.com/uoe-team32/tensorflow

ARG njobs

USER root

RUN apt update && apt upgrade -y

RUN apt install -y tk-dev

ENV NP_MAKE="${njobs}" \
    ONEDNN_BUILD="${onednn_opt}" \
    ONEDNN_VERSION="${onednn_version}" \
    CPU="native" \
    TF_VERSION_ID="${tf_id}"

# Key version numbers
ENV PY_VERSION=3.7.0 \
    ARMPL_VERSION=20.2.1 \
    OPENBLAS_VERSION=0.3.9

# Package build parameters
ENV PROD_DIR=/opt \
    PACKAGE_DIR=/packages


# Common compiler settings
ENV CC=gcc \
    CXX=g++ \
    BASE_CFLAGS="-mcpu=${CPU}  -moutline-atomics"

ENV ARMPL_DIR=$PROD_DIR/armpl/armpl_${ARMPL_VERSION}_gcc-9.3

ENV BASE_LDFLAGS="-L$ARMPL_DIR/lib -lamath -lm" \
    LD_LIBRARY_PATH=$ARMPL_DIR/lib

COPY scripts/update-cpython.sh $PACKAGE_DIR/update-cpython.sh

RUN chmod 777 $PACKAGE_DIR/update-cpython.sh

RUN $PACKAGE_DIR/update-cpython.sh

USER ubuntu
