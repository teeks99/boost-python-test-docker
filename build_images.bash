
for compiler in clang-11 gcc-9
do
  pushd $compiler
  echo docker build -t teeks99/boost-python-test:$compiler .
  docker build -t teeks99/boost-python-test:$compiler .
  popd
done

