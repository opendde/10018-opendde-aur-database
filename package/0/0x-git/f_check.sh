check() {
	export RUSTUP_TOOLCHAIN=stable
	cd "$pkgname"
	cargo test --frozen --all-features
}
