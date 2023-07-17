pkgver() {
  cd "$srcdir/$pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
}
