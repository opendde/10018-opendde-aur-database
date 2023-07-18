package() {
           cd "${srcdir}"
           install -dm755 "${pkgdir}/usr/share/${pkgname}"
           install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
           install -dm755 "${pkgdir}/usr/bin"
           cp -rf 0d1n-master/*	"${pkgdir}/usr/share/${pkgname}/"
           mv "${pkgdir}/usr/share/${pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/"
           ln -s "/usr/share/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}" 
}
