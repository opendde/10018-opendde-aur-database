package() {
  bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.xz"
  install -Dm0644 "${pkgdir}/opt/1Password/com.1password.1Password.policy" -t "${pkgdir}/usr/share/polkit-1/actions/"
  chmod 4755 "${pkgdir}/opt/1Password/chrome-sandbox" || true
  install -dm0755 "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgname}/${_binname}" "${pkgdir}/usr/bin/${_binname}"
}
