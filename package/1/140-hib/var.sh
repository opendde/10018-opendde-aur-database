pkgname=140-hib
pkgver=1389820765
pkgrel=2
pkgdesc="140 is a challenging minimalistic platformer with abstract colorful graphics."
arch=('i686' 'x86_64')
url="http://www.game140.com/"
license=('custom: commercial')
depends=('glu')
depends_i686=('gtk2')
depends_x86_64=('lib32-gtk2')
source=("hib://140_Linux_${pkgver}.zip"
        "${pkgname}.desktop")
sha256sums=('SKIP'
            'a81be607cd7a7a7795ddeed0386d9d62eaffb56651d4217e99684ce07ea53883')
[ "$CARCH" == "x86_64" ] && _arch="x86_64" || _arch="x86"
PKGEXT='.pkg.tar'
DLAGENTS+=("hib::/usr/bin/echo %u - This is is not a real URL, you need to download the humble bundle file manually to \"$PWD\" or setup a hib:// DLAGENT. Read this PKGBUILD for more information.")
