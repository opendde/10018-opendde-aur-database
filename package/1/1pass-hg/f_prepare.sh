prepare() {
  patch -p0 -i "1pass-lua.patch"
  rm -rf "${_pkgname}/build"
  mkdir "${_pkgname}/build"
}
