package() {
  cd "${srcdir}"
  install -d -m755 $pkgdir/usr/{bin,share}
  cp -a "0xDBE-${_buildver}" "${pkgdir}/usr/share/${_pkgname}"
  chown -R root:root "${pkgdir}/usr/share"
  find "$pkgdir/usr/share/$_pkgname" -type d -exec chmod 0755 {} ';'
  find "$pkgdir/usr/share/$_pkgname" -type f -exec chmod 0644 {} ';'
  # never wait on user input when starting idea; copied from -ce PKGBUILD
  sed -i '/.*read IGNORE.*/ d' "${pkgdir}"/usr/share/$_pkgname/bin/${_pkgname}.sh
  chmod +x "$pkgdir"/usr/share/$_pkgname/bin/${_pkgname}.sh
  chmod +x "$pkgdir"/usr/share/$_pkgname/bin/fsnotifier
  chmod +x "$pkgdir"/usr/share/$_pkgname/bin/fsnotifier64
  install -D -m755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
  install -D -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -D -m644 "$srcdir/0xDBE-$_buildver/bin/product.png" "$pkgdir/usr/share/pixmaps/${_pkgname}.png"
  
  install -d -m755 "$pkgdir/usr/share/licenses/${_pkgname}"
  install -D -m644 "$srcdir"/0xDBE-${_buildver}/license/* "$pkgdir"/usr/share/licenses/${_pkgname}
}
