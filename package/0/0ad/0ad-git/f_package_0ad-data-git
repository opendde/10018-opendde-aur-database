package_0ad-data-git() {
  pkgdesc="Data package for 0ad built from git development version."
  depends=('0ad-git')
  conflicts=('0ad-data')
  provides=('0ad-data')
  mkdir -p ${pkgdir}/usr/share/${_pkgname}-git
  cd "$srcdir/${_pkgname}"
  cp -r "binaries/data" "${pkgdir}/usr/share/${_pkgname}-git"
}
