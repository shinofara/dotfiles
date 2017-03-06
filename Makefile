setup:
	ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

golang:
	go get github.com/rogpeppe/godef
	go get -u github.com/nsf/gocode
	go get github.com/golang/lint/golint
	go get github.com/kisielk/errcheck
