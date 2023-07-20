package() {
	cd ${srcdir}
	if [ "$CARCH" = "i686" ]; then
		install -D -m644 ${srcdir}/115upload_plugin.so ${pkgdir}/usr/lib/mozilla/plugins/115upload_plugin.so
	elif [ "$CARCH" = "x86_64" ]; then
		install -D -m644 ${srcdir}/115upload_plugin.so ${pkgdir}/usr/lib/mozilla/plugins/115upload_plugin.so
	fi
}
