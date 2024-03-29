package() {
  # Go to source directory
  cd "${srcdir}/${_pkgname}-${pkgver//_/-}.x64" || exit 1
  # Install icons
  resolutions=(32x32 64x64 256x256 512x512)
  for resolution in "${resolutions[@]}"; do
    install -Dm0644 "resources/icons/hicolor/${resolution}/apps/${_pkgname}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${resolution}/apps/${_pkgname}.png"
  done
  # Install desktop file
  install -Dm0644 resources/${_pkgname}.desktop -t "${pkgdir}"/usr/share/applications/
  # Install system unlock PolKit policy file
  install -Dm0644 com.1password.1Password.policy -t "${pkgdir}"/usr/share/polkit-1/actions/
  # Install examples
  install -Dm0644 resources/custom_allowed_browsers -t "${pkgdir}"/usr/share/doc/${_pkgname}/examples/
  # Move package contents to /opt/1Password
  cd "${srcdir}" || exit 1
  install -dm0755 "${pkgdir}"/opt
  mv "${_pkgname}-${pkgver//_/-}.x64" "${pkgdir}/opt/1Password"
}
