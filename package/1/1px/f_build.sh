build() {
	cd "$srcdir/${pkgname%-git}"
    (cd bat && \
        meson builddir && \
        meson compile -C builddir)
}
