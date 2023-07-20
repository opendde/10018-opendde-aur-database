package() {
    # Launcher and Data
    install -Dm755 "${srcdir}/140.${_arch}" "${pkgdir}/opt/${pkgname}/140.${_arch}"
    mv "${srcdir}/140_Data" "${pkgdir}/opt/${pkgname}/"
    # Install Binaries/Launchers
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/${pkgname}/140.${_arch}"  "${pkgdir}/usr/bin/${pkgname}"
    # Desktop Integration
    mkdir -p "$pkgdir/usr/share/pixmaps"
    ln -s "/opt/${pkgname}/140_Data/Resources/UnityPlayer.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    # Fix wonky permissions
    find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} \;
    find "${pkgdir}/opt/${pkgname}" -type f -exec chmod 644 {} \;
    chmod 755 "${pkgdir}/opt/${pkgname}/140.${_arch}"
}
