package() {
	cd $srcdir
	install -dm755 ${pkgdir}/usr/lib
	ln -s /usr/lib/libenchant-2.so ${pkgdir}/usr/lib/libenchant.so.1
	#cp 1cestart-fix.png ${pkgdir}/usr/share/icons/hicolor/512x512/apps/ 
	#cp 1cestart-fix.sh ${pkgdir}/usr/bin 
    install -dm755 $pkgdir/usr/bin
    install -Dm755 1cestart-fix.sh $pkgdir/usr/bin/
    install -dm755 $pkgdir/usr/share/1C_Fix
    install -Dm755 1cestart-fix.png $pkgdir/usr/share/1C_Fix
    
    install -dm755  $pkgdir/usr/share/applications
    install -Dm755 1cestart-fix.desktop $pkgdir/usr/share/applications
}
