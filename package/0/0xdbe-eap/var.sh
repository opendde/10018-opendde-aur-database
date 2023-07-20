pkgname=0xdbe-eap
_pkgname=0xdbe
pkgver=143.1301.4
_buildver=$pkgver
pkgrel=1
pkgdesc='Smart SQL Editor and Advanced Database Client Packed Together for Optimum Productivity'
arch=('i686' 'x86_64') # not 'any' because of fsnotifier
url="https://confluence.jetbrains.com/display/DBE/0xDBE+1.0+EAP"
backup=("usr/share/${_pkgname}/bin/${_pkgname}.vmoptions" "usr/share/${_pkgname}/bin/${_pkgname}64.vmoptions")
license=('Commercial')
depends=('java-environment' 'giflib')
source=("http://download.jetbrains.com/dbe/${_pkgname}-${_buildver}.tar.gz" \
        "${_pkgname}.sh" \
        "${_pkgname}.desktop")
md5sums=('f82191827ba65d431601f3c71b9f05f3'
         '864c5bb6071568a1a9f26573e090207b'
         'e520ed91c5c0578cc93df0cd7e03166b')
