package() {
  cd "${srcdir}"
  _source=source_${CARCH}
  _filename=${!_source##*/}
  _installer=${_filename%%$pkgver*}
  install -dm 755 "${pkgdir}/opt"
  cp -r "${pkgname}" "${_}/"
  # Clean up unnecessary items (assitant is part of qt5-tools)
  rm -r "${pkgdir}/opt/${pkgname}/"{'assistant','uninstall'}
  install -dm 755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/010editor" "${_}/010editor"
  install -dm 755 "${pkgdir}/usr/share/pixmaps"
  ln -s "/opt/${pkgname}/010_icon_128x128.png" "${_}/010editor.png"
  install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/opt/${pkgname}/license.txt" "${_}/license.txt"
  install -Dm 644 '010editor.desktop' "${pkgdir}/usr/share/applications/010editor.desktop"
}
