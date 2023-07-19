<<<<<<< HEAD
pkgname=0bin-git
pkgver=r229.7da1615
pkgrel=1
pkgdesc="A python2 client side encrypted pastebin that can run without a database."
arch=('any')
url="https://0bin.readthedocs.org/en/latest/"
license=('WTFPL')
depends=('python2' 'python2-setuptools' 'python2-bottle' 'python2-cherrypy' 'python2-clize' 'python2-privilege')
makedepends=('git')
backup=('usr/lib/python2.7/site-packages/zerobin/default_settings.py')
source=("$pkgname"::'git+https://github.com/sametmax/0bin.git#revision=66fe5d4088692bed0b9e2740dee9991d3c41e2b4' 'LICENSE' 'zerobin.install' 'zerobin.service')
md5sums=('SKIP'
=======

>>>>>>> df51e9d526f06fb909cc409ad45a807e958b0120
