package() {
  cd "${srcdir}/${_pkgname}/build-native"
  make PREFIX="/usr" DESTDIR="${pkgdir}" install
  # install docs
  cd "${srcdir}/${_pkgname}/doc"
  mkdir -p "$pkgdir/usr/share/doc/${_pkgname}"
  cp *.txt "$pkgdir/usr/share/doc/${_pkgname}/"
  cd ..
  cp AUTHORS CHANGES CHANGES-GIT CODE_OF_CONDUCT COMPILING COPYING HACKING NEWS PHILOSOPHY README.md "$pkgdir/usr/share/doc/${_pkgname}/"
  # create storage directory for MOO data
  mkdir -p "$pkgdir/usr/share/1oom"
  # install launch script
  mv "$pkgdir/usr/bin/1oom_classic_sdl2" "$pkgdir/usr/bin/1oom_classic_sdl2-bin"
  install -m 0755 "${srcdir}/1oom_classic_sdl2.sh" "$pkgdir/usr/bin/1oom_classic_sdl2"
  # install icon
  install -Dm 0644 ${srcdir}/Master_of_Orion_cover.png $pkgdir/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png
  # install desktop file
  install -Dm644 ${srcdir}/${_pkgname}.desktop $pkgdir/usr/share/applications/${_pkgname}.desktop
}
