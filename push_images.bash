
for compiler in clang-11 gcc-9
do
  docker push teeks99/boost-python-test:$compiler
done

