prepare() {
    cp 123UNIX1.IMG 123UNIX2.IMG 123UNIX3.IMG 123UNIX4.IMG 123UNIX5.IMG "$BINUTILS_XZ" "$pkgname"/
	cd "$pkgname"
    y | ./extract.sh
}
