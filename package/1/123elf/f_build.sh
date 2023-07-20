build() {
    cd "$srcdir/$pkgname-$pkgver"
    ln -s ../../123UNIX1.IMG .
    ln -s ../../123UNIX2.IMG .
    ln -s ../../123UNIX3.IMG .
    ln -s ../../123UNIX4.IMG .
    ln -s ../../123UNIX5.IMG .
    ln -s ../../binutils-2.38.tar.xz .
    CFLAGS="" CPPFLAGS="" LDFLAGS="" ./binutils.sh
    ./extract.sh
    make
}
