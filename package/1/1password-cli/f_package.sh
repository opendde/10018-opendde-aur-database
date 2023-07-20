package() {
  install -Dm755 op "${pkgdir}"/usr/bin/op
  install -d 755 "${pkgdir}"/usr/share/zsh/site-functions
  "${pkgdir}"/usr/bin/op completion zsh > "${pkgdir}"/usr/share/zsh/site-functions/_op
}
