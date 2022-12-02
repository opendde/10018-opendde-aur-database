package() {
   cd "$srcdir/$pkgname"
   python2 setup.py install --root="$pkgdir/" --optimize=1
   install -D -m644 "${srcdir}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
   install -Dm644 ../zerobin.service "${pkgdir}"/usr/lib/systemd/system/zerobin.service
}
