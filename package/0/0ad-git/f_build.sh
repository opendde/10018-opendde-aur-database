build() {
  cd "$srcdir/${_pkgname}/build/workspaces"
  ./update-workspaces.sh \
      --without-pch \
      --bindir=/usr/bin \
      --libdir=/usr/lib/0ad \
      --datadir=/usr/share/${pkgname}/data
  cd gcc
  VERBOSE=1 make 
  
  
}
