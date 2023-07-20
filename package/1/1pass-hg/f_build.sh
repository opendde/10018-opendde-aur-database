build() {
  cd "${_pkgname}/build"
  cmake -DCMAKE_BUILD_TYPE=Release ..
  make
}
