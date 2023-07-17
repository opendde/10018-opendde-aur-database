package() {
  cd "${srcdir}"
  unzip -o "${_modname}.pyromod" "ARTWORK_and_LICENSE.txt"
  install -Dm644 "ARTWORK_and_LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"  
  install -Dm644 "${_modname}.pyromod" -t "${pkgdir}/usr/share/0ad/data/mods/${_modname}"
  cd "${pkgdir}/usr/share/0ad/data/mods/${_modname}"
  unzip -o "${_modname}.pyromod" "mod.json"
}
