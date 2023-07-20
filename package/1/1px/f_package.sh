package() {
	cd "$srcdir/${pkgname%-git}"
    install -s -p bat/builddir/1pxbat -D "$pkgdir"/usr/bin/1pxbat
    install -m 0644 -p LICENSE -D "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
