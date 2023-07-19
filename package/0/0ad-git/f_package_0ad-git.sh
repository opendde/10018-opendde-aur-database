package_0ad-git() {
  depends=('0ad-data-git' 'binutils' 'boost-libs' 'curl' 'enet' 'libogg' 'libpng' 'libvorbis'
           'libxml2' 'openal' 'sdl2' 'wxwidgets-gtk3' 'zlib' 'libgl' 'glu' 'fmt'
           'gloox' 'miniupnpc' 'libminiupnpc.so' 'icu' 'nspr' 'libsodium')
  conflicts=('0ad')
  provides=('0ad')
  install -d "${pkgdir}"/usr/{bin,lib/0ad,share/"${_pkgname}"/data}
  cd "$srcdir/${_pkgname}"
  install -Dm755 binaries/system/pyrogenesis "${pkgdir}/usr/bin"
  
  
  install -Dm755 binaries/system/*.so "${pkgdir}/usr/lib/0ad"
  cp -r binaries/data/l10n/ "${pkgdir}/usr/share/${_pkgname}/data/"
  install -Dm755 build/resources/${_pkgname}.sh "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 build/resources/${_pkgname}.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 build/resources/${_pkgname}.png "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}
