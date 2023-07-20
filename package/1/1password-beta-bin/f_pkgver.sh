pkgver() {
  cd "${srcdir}" || exit 1
  cd "$(ls -d */ | head -n1)" || exit 1
  ./1password --version | sed 's|-|_|g'
}
