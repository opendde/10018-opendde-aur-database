pkgver() {
    cd "${srcdir}"
    unzip -oq "${_modname}.pyromod" "mod.json"
    cat "mod.json" | grep -oP '(?<="version": ")[^"]*' 
}
