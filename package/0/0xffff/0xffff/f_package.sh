package() {
	cd "0xFFFF-$pkgver"
	make PREFIX=/usr DESTDIR=$pkgdir install
}
