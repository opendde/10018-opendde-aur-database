pkgname=1pass-hg
_pkgname=1pass
pkgver=r58.1390348facc7
pkgrel=1
pkgdesc="1Password-compatible password management tool for Linux"
arch=('i686' 'x86_64')
license=('zlib')
url="https://www.icculus.org/1pass/"
depends=('gtk2' 'libxtst')
makedepends=('cmake' 'mercurial')
source=("hg+http://hg.icculus.org/icculus/1pass/"
        "1pass-lua.patch")
sha512sums=('SKIP'
            '8754cc7ff10546045a72f96ed608d9af6acad8b6274407df44807ce699b570fda630d2a2157df582f65e9f1070580d16c7e368303e9f42e42b8e263d36f6e6db')
