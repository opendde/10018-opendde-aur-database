build() {
  cd "$srcdir/${_pkgname}/build/workspaces"
  ./update-workspaces.sh \
      --without-pch \
      --bindir=/usr/bin \
      --libdir=/usr/lib/0ad \
      --datadir=/usr/share/${pkgname}/data
#  cd "$srcdir/${_pkgname}/libraries/source/fcollada/src"
#  make # always keep uncommented
#  # OPTIONAL: uncomment for a debug build, it's a 2nd executable named
#  # `pyrogenesis_dbg`
#  # It's independent from the debug symbols and not as important as them.
#  # https://trac.wildfiregames.com/wiki/Debugging#CallstackonLinuxmacOS
#  # It's likely a small increase of build time.
#  # And up to a 1.2 GiB in total used space. (inc. package build files)
#  # Note there is something else to uncomment below in package_0ad-git()
#  # make config=debug
  cd gcc
  VERBOSE=1 make # always keep uncommented
  # OPTIONAL: uncomment for a debug build, see above
  # make config=debug
}
