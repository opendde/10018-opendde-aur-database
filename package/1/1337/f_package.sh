package() {
    mkdir -p $pkgdir/usr/bin
    install -D -m755 ./1337 $pkgdir/usr/bin/$pkgname
}
