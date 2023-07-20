pkgname=1oom-git
_pkgname=1oom
pkgver=r1047.813ab8df
pkgrel=1
pkgdesc="1oom is a Master of Orion (1993) game engine recreation."
arch=(x86_64)
url=https://github.com/1oom-fork/1oom
license=('GPL2')
depends=(sdl2 sdl2_mixer libsamplerate soundfont-fluid)
makedepends=(git)
provides=(1oom)
conflicts=(1oom)
source=(  'git+https://github.com/1oom-fork/1oom.git'
          'Master_of_Orion_cover.png'
          '1oom.desktop'
          '1oom_classic_sdl2.sh' )
md5sums=('SKIP'
         '49248e72b7ddc5209cca2c1c61099d85'
         'ccac2feb67cecfc30b8156edf106b7ca'
         '41b52627b2d52b477adcbc2a9a627b37')
