prepare() {
  sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' ${pkgname}.py
}
