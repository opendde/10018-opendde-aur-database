pkgver() {
    cd "${srcdir}/${_pkgname}"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}
