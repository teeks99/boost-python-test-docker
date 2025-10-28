source boost_version.bash

for compiler in clang-21 gcc-15
do
  docker push teeks99/boost-python-test:${compiler}
  docker push teeks99/boost-python-test:${compiler}_${BOOST_RELEASE}

  git tag ${compiler}_${BOOST_RELEASE}
  git push origin ${compiler}_${BOOST_RELEASE}
done

