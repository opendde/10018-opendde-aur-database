branch '0ad-git' set up to track 'origin/0ad-git'.
pkgname=('0ad-git' '0ad-data-git')
_pkgname=0ad
epoch=1
pkgver=A26.r63.g43444ea887
pkgrel=1
pkgdesc="Cross-platform, 3D and historically-based real-time strategy game - built from git development version."
arch=('i686' 'x86_64')
url="http://play0ad.com/"
license=('GPL2' 'CCPL')
makedepends=('boost' 'cmake' 'mesa' 'zip' 'libsm' 'rust' 'python' 'clang' 'git'
             'enet' 'fmt' 'gloox' 'glu' 'libgl' 'libminiupnpc.so' 'libogg'
             'libpng' 'libsodium' 'libvorbis' 'miniupnpc' 'nspr' 'openal'
             'sdl2' 'wxwidgets-gtk3')
options=('!lto') # breaks spidermonkey linking (https://bugs.gentoo.org/746947)
source=("git+https://github.com/0ad/0ad.git")
md5sums=('SKIP')
pkgver() {
  cd ${_pkgname}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
prepare() {
  cd "$srcdir/${_pkgname}"
}
build() {
  cd "$srcdir/${_pkgname}/build/workspaces"
  ./update-workspaces.sh \
      --without-pch \
      --bindir=/usr/bin \
      --libdir=/usr/lib/0ad \
      --datadir=/usr/share/${pkgname}/data
  cd gcc
  VERBOSE=1 make # always keep uncommented
  # OPTIONAL: uncomment for a debug build, see above
  # make config=debug
}
package_0ad-git() {
  depends=('0ad-data-git' 'binutils' 'boost-libs' 'curl' 'enet' 'libogg' 'libpng' 'libvorbis'
           'libxml2' 'openal' 'sdl2' 'wxwidgets-gtk3' 'zlib' 'libgl' 'glu' 'fmt'
           'gloox' 'miniupnpc' 'libminiupnpc.so' 'icu' 'nspr' 'libsodium')
  conflicts=('0ad')
  provides=('0ad')
  install -d "${pkgdir}"/usr/{bin,lib/0ad,share/"${_pkgname}"/data}
  cd "$srcdir/${_pkgname}"
  install -Dm755 binaries/system/pyrogenesis "${pkgdir}/usr/bin"
  # OPTIONAL: uncomment below for debug build. See the comments around the `make` calls
  #install -Dm755 binaries/system/pyrogenesis_dbg "${pkgdir}/usr/bin"
  install -Dm755 binaries/system/*.so "${pkgdir}/usr/lib/0ad"
  cp -r binaries/data/l10n/ "${pkgdir}/usr/share/${_pkgname}/data/"
  install -Dm755 build/resources/${_pkgname}.sh "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 build/resources/${_pkgname}.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 build/resources/${_pkgname}.png "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}
package_0ad-data-git() {
  pkgdesc="Data package for 0ad built from git development version."
  depends=('0ad-git')
  conflicts=('0ad-data')
  provides=('0ad-data')
  mkdir -p ${pkgdir}/usr/share/${_pkgname}-git
  cd "$srcdir/${_pkgname}"
  cp -r "binaries/data" "${pkgdir}/usr/share/${_pkgname}-git"
}
