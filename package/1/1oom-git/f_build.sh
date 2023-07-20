build() {
  cd ${_pkgname}
  autoreconf -fi
  test -d build-native || mkdir build-native
  cd build-native
  ../configure --prefix=/usr
  { test "$(nproc)" -gt 1 && make -j"$(nproc)" ;} || make
}
