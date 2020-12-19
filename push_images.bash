source boost_version.bash

for compiler in clang-11 gcc-9
do
  docker push teeks99/boost-python-test:$compiler
  docker push teeks99/boost-python-test:$compiler_$BOOST_RELEASE
done

