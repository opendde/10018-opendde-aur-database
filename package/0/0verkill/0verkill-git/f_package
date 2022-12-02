package() {
	cd "$_name"
	make DESTDIR="$pkgdir" install
	install -Dpm644 'doc/COPYING' -t "${pkgdir}/usr/share/licenses/${_name}/"
}
