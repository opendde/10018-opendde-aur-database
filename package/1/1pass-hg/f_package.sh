package() {
  # the package has no install target
  install -Dm755 "${srcdir}/${_pkgname}/build/1pass" "${pkgdir}/usr/bin/1pass"
  install -Dm644 "${srcdir}/${_pkgname}/1pass.lua" \
                 "${pkgdir}/usr/share/1pass/1pass.lua"
  install -Dm644 "${srcdir}/${_pkgname}/JSON.lua" \
                 "${pkgdir}/usr/share/1pass/JSON.lua"
  install -Dm644 "${srcdir}/${_pkgname}/dumptable.lua" \
                 "${pkgdir}/usr/share/1pass/dumptable.lua"
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE.txt" \
                 "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
}
