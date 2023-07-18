package() {
  cd "${srcdir}/${pkgname}"
  install -Dm 755 0xff "${pkgdir}/usr/bin/0xff"
  install -Dm 644 ../../nginx.conf "${pkgdir}/usr/share/0xff/nginx.conf"
  install -Dm 644 ../../0xff.service "${pkgdir}/usr/lib/systemd/system/0xff.service"
}
