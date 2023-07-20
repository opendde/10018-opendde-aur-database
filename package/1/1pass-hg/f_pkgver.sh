pkgver() {
  cd "${_pkgname}"
  local rev="$(hg identify -n)"
  local commit="$(hg identify -i)"
  printf "r%s.%s" ${rev//+/} ${commit//+/}
}
