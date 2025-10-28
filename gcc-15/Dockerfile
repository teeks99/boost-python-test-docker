FROM teeks99/boost-cpp-docker:gcc-15
LABEL maintainer="Thomas Kent <docker@teeks99.com>"

ARG release=1.89.0
ARG release_file=boost_1_89_0
ENV BOOST_PY_DEPS=/boost_py_deps
ENV BOOST_SRC=/boost_src

RUN apt-get update \
  # Setup and doc Prereqs
  && apt-get install -y \
    python3-pip \
    xsltproc \
    docbook-xsl \
    python3-setuptools \
  # Get Faber for standalone builds
  && python3 -m pip install --break-system-packages faber \
  # Boost Source and Needed Prereqs, remove python though
  && wget -O ${release_file}.tar.gz -nv https://sourceforge.net/projects/boost/files/boost/${release}/${release_file}.tar.gz/download \
  && tar xf ${release_file}.tar.gz \
  && rm ${release_file}.tar.gz \
  && mv ${release_file} ${BOOST_SRC} \
  && cd ${BOOST_SRC} \
  && ./bootstrap.sh \
  && cp -r ${BOOST_SRC} ${BOOST_PY_DEPS} \
  && rm -rf ${BOOST_PY_DEPS}/boost/python* \
  && rm -rf ${BOOST_PY_DEPS}/libs/python*
