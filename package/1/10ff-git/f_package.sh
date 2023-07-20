package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root=$pkgdir
  install -Dm644 "$srcdir/$_pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
