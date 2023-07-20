package() {
        tar -C ${srcdir} -xf data.tar.xz
	mkdir -p ${pkgdir}/opt/
	install -Dm644 ${srcdir}/115.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
        install -Dm644 ${srcdir}/usr/local/115/res/115.png ${pkgdir}/usr/share/icons/hicolor/256x256/apps/115pc.png
	cp -rT ${srcdir}/usr/local/115 ${pkgdir}/opt/${pkgname}
	# permission tweaks
	chmod a+x ${pkgdir}/opt/115pc/libexec/QtWebEngineProcess
	install -Dm755 ${srcdir}/115pc ${pkgdir}/usr/bin/115pc
}
