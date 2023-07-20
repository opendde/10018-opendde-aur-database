package() {
  cd "$pkgname"
  sharepath="${pkgdir}/usr/share"
  install -m 755 -D 1pass "$pkgdir/usr/bin/1pass"
  install -m 644 -D 1pass.el "$pkgdir/usr/share/emacs/site-lisp/$pkgname/1pass.el"
  install -m 644 -D fuzzpass.fish "$pkgdir/usr/share/fish/vendor_functions.d/fuzzpass.fish"
  install -m 644 -D fuzzpass.sh "$pkgdir/usr/share/1pass/fuzzpass.sh"
  install -m 644 -D config.sample "$pkgdir/usr/share/1pass/config.sample"
}
