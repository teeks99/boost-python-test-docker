set -e
set -o pipefail

source boost_version.bash

for compiler in clang-12 gcc-10
do
  pushd $compiler
  echo Building For: teeks99/boost-python-test:${compiler} with ${BOOST_RELEASE}
  docker build --pull -t teeks99/boost-python-test:${compiler} \
    --build-arg release=$BOOST_RELEASE \
    --build-arg release_file=$BOOST_RELEASE_FILE \
    .
  docker tag teeks99/boost-python-test:${compiler} teeks99/boost-python-test:${compiler}_${BOOST_RELEASE}
  popd
done

