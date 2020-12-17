FROM teeks99/boost-cpp-docker:gcc-9
LABEL maintainer="Thomas Kent <docker@teeks99.com>"

ARG release=1.66.0
ARG release_file=boost_1_66_0
ENV BOOST_PY_DEPS=/boost_py_deps
ENV BOOST_SRC=/boost_src

RUN apt-get update \
  # Setup and doc Prereqs
  && apt-get install -y \
    python3-pip \
    xsltproc \
    docbook-xsl \
  # Common name for clang
  && ln -s /usr/bin/clang++-11 /usr/bin/clang++ \
  # Get Faber for standalone builds
  && python3 -m pip install setuptools \
  && python3 -m pip install faber \
  # Boost Source and Needed Prereqs, remove python though
  && wget -O ${release_file}.tar.gz -nv https://sourceforge.net/projects/boost/files/boost/${release}/${release_file}.tar.gz/download \
  && tar xf ${release_file}.tar.gz \
  && rm ${release_file}.tar.gz \
  && mv ${release_file} ${BOOST_SRC} \
  && cd ${BOOST_SRC} \
  && ./bootstrap.sh \
  && ./b2 tools/bcp \
  && mkdir -p ${BOOST_PY_DEPS} \
  && dist/bin/bcp python tools/boostbook tools/quickbook ${BOOST_PY_DEPS} \
  && rm -rf ${BOOST_PY_DEPS}/boost/python*
