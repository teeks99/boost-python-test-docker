source boost_version.bash

for compiler in clang-12 gcc-10
do
  docker push teeks99/boost-python-test:${compiler}
  docker push teeks99/boost-python-test:${compiler}_${BOOST_RELEASE}

  git tag ${compiler}_${BOOST_RELEASE}
  git push origin ${compiler}_${BOOST_RELEASE}
done

