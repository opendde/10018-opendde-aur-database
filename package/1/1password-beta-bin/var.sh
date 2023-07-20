pkgname=1password-beta-bin
_pkgname=1password
pkgver=8.1.0_60.BETA
pkgrel=1
conflicts=('1password')
pkgdesc="Password manager and secure wallet - (bin)"
arch=('x86_64')
url='https://1password.com'
license=('LicenseRef-1Password-Proprietary')
depends=('gtk3' 'nss')
options=(!strip)
_tar="1password-latest.tar.gz"
install="${_pkgname}.install"
source=(https://downloads.1password.com/linux/tar/beta/"${CARCH}"/"${_tar}"{,.sig})
sha256sums=('SKIP'
  'SKIP')
validpgpkeys=('3FEF9748469ADBE15DA7CA80AC2D62742012EA22')
