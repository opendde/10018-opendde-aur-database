pkgname=0xff
pkgver=1.1.0
pkgrel=3
pkgdesc="Simple http(s) file sharing tool. Think 'python -m http.server' but better."
arch=('any')
url='https://github.com/xengi/0xff'
license=('MIT')
source=("git+https://github.com/XenGi/0xff#tag=v${pkgver}")
sha256sums=('SKIP')
install='0xff.install'
makedepends=('go')
