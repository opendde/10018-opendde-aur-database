package() {
  cd "${srcdir}"
  install -Dm644 04B_21__.TTF "${pkgdir}"/usr/share/fonts/TTF/04B_21__.ttf
  install -Dm644 about.gif "${pkgdir}"/usr/share/licenses/$pkgname/license.gif
}
