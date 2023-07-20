<<<<<<< HEAD
pkgname=0x-git
pkgver=r1.8070704
pkgrel=2
pkgdesc='Colorized hex dump viewer'
arch=('x86_64')
url='https://github.com/mcy/0x'
license=('Apache')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')
=======

>>>>>>> 633d50acfd61d13f47b9299ea333b00630c7e466
