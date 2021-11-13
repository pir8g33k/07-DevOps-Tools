#!/bin/bash
# Install golang from standard Ubuntu repos.
sudo apt update && sudo apt -y upgrade
sudo apt install -y software-properties-common

# If installing later versions manually
sudo add-apt-repository -y ppa:longsleep/golang-backports
sudo apt update
#sudo apt install -y golang-1.11
# - Or -
sudo apt install -y golang-go

# If letting default pkg manager do install
#sudo apt install -y golang-go.tools
# Set up Go folders
mkdir -p $HOME/go/src

# Show Go version installed
go version

# Set up .profile to tell Go where to look for files
touch ~/.profile
echo 'export GOPATH=$HOME/go' >> ~/.profile
echo 'export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin' >> ~/.profile

# Install commonly used tools
echo "Installing commonly used tools for developing in Go..."
go get golang.org/x/tools/cmd/godoc
go get github.com/zmb3/gogetdoc
go get github.com/mdempsky/gocode
go get github.com/uudashr/gopkgs/cmd/gopkgs
go get github.com/ramya-rao-a/go-outline
go get github.com/acroca/go-symbols
go get golang.org/x/tools/cmd/guru
go get golang.org/x/tools/cmd/gorename
go get github.com/go-delve/delve/cmd/dlv
go get github.com/stamblerre/gocode
go get github.com/rogpeppe/godef
go get github.com/sqs/goreturns
go get golang.org/x/lint/golint
go get github.com/stamblerre/gocode

echo "Installing 'realize' to allow for touch reload..."
go get github.com/oxequa/realize

# (re)-source .profile to apply changes
source ~/.profile

