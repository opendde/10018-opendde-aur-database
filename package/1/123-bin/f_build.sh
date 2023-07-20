build() {
    cd "$pkgname"
    KEYMAPS=""
    for k in xterm rxvt-unicode-256color xterm-256color rxvt terminology; do
        [ -e /usr/share/terminfo/${k:0:1}/$k ] && KEYMAPS="${KEYMAPS} ${k}";
    done
    ./binutils.sh || true
    PATH="$PWD:$PATH" make KEYMAPS="$KEYMAPS"
}
