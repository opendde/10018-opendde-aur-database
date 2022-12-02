package() {
  cd $srcdir
  install -Dm755 0cc-famitracker $pkgdir/usr/bin/0cc-famitracker
  install -Dm644 0cc-famitracker.desktop $pkgdir/usr/share/applications/0cc-famitracker.desktop
  install -Dm644 0cc-famitracker.png $pkgdir/usr/share/pixmaps/0cc-famitracker.png
  
  install -Dm644 $_filename/0CC-readme.txt $pkgdir/usr/share/doc/0cc-famitracker/readme.txt
  install -Dm644 $_filename/specs.txt $pkgdir/usr/share/doc/0cc-famitracker/specs.txt
  install -Dm644 $_filename/changelog.txt $pkgdir/usr/share/doc/0cc-famitracker/changelog.txt
  
  cp -rT $_filename $pkgdir/usr/share/0cc-famitracker
  find $pkgdir/usr/share/0cc-famitracker -type d -exec chmod 755 "{}" \;
  find $pkgdir/usr/share/0cc-famitracker -type f -exec chmod 644 "{}" \;
}
