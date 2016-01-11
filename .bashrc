# Go PATH

if [ -x "`which go`" ] ; then
	export GOROOT=`go env GOROOT`
	export GOPATH=$HOME/go
	export PATH=$PATH:$GOPATH/bin
fi
