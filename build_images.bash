source boost_version.bash

for compiler in clang-11 gcc-9
do
  pushd $compiler
  echo Building For: teeks99/boost-python-test:$compiler
  docker build -t teeks99/boost-python-test:$compiler \
    --build-arg release=$BOOST_RELEASE \
    --build-arg release_file=$BOOST_RELEASE_FILE \
    .
  docker tag teeks99/boost-python-test:$compiler teeks99/boost-python-test:$compiler_$BOOST_RELEASE
  popd
done

