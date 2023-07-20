package() {
    cd "$srcdir/$pkgname-$pkgver"
    make install prefix="$pkgdir"/usr/
}
