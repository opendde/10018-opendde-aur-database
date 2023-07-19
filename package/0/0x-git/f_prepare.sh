prepare() {
	cd "$pkgname"
	cargo update
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}
