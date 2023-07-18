build() {
  cd "${srcdir}/${pkgname}"
  GOPATH="${srcdir}" go get -u github.com/labstack/echo/...
  GOPATH="${srcdir}" go get -u github.com/peterbourgon/diskv
  GOPATH="${srcdir}" go get -u github.com/satori/go.uuid
  GOPATH="${srcdir}" go build 0xff.go
}
