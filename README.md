This is a test reproducer for https://github.com/go-critic/go-critic/issues/1359

Directions:

1. Put go-critic source in a well-known location:
```
mkdir -p $GOPATH/src/github.com/go-critic/go-critic
git clone https://github.com/go-critic/go-critic.git $GOPATH/src/github.com/go-critic/go-critic
```

2. Run this test with both go1.20 and go1.21
```
./test.sh
```

Results:
```
go version go1.20.7 darwin/arm64
Hello, world
go env GOROOT=/Users/liggitt/projects/20230809-gocricit/_output/.gimme/versions/go1.20.7.darwin.arm64
GOROOT=/Users/liggitt/projects/20230809-gocricit/_output/.gimme/versions/go1.20.7.darwin.arm64
debug: imported "fmt" from source importer
debug: imported "io" from importer cache
debug: imported "io" from importer cache
debug: imported "io" from importer cache

go version go1.21.0 darwin/arm64
Hello, world
go env GOROOT=/Users/liggitt/projects/20230809-gocricit/_output/.gimme/versions/go1.21.0.darwin.arm64
GOROOT=/Users/liggitt/projects/20230809-gocricit/_output/.gimme/versions/go1.21.0.darwin.arm64
debug: failed to import "fmt":
debug:   gc importer: can't find import: "fmt"
debug:   source importer: cannot find package "fmt" in any of:
	($GOROOT not set)
	($GOPATH not set. For more details see: 'go help gopath')
debug:   GOROOT="" GOPATH=""
debug: failed to import "fmt":
debug:   gc importer: can't find import: "fmt"
debug:   source importer: cannot find package "fmt" in any of:
	($GOROOT not set)
	($GOPATH not set. For more details see: 'go help gopath')
debug:   GOROOT="" GOPATH=""
panic: load embedded ruleguard rules: rules/rules.go:13: can't load fmt

goroutine 1 [running]:
main.main()
	/Users/liggitt/go/src/github.com/go-critic/go-critic/cmd/gocritic/main.go:16 +0x58
```