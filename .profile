# GPG KEY
export GPGKEY=AE784DD2


export MOZ_DISABLE_PANGO=1

# NodeJS
export NPM_PACKAGES=$HOME/.npm-packages
export MANPATH=$MANPATH:$NPM_PACKAGES/share/man
export NODE_PATH=$NODE_PATH:$NPM_PACKAGES/lib/node_modules

# Go
export GOROOT=$HOME/go
export GOPATH=$GOROOT:.
export GOARCH=amd64
export GOOS=linux

# Dart
export DARTSDK=$HOME/dart-sdk

PATH=$PATH:$HOME/.local/bin:$HOME/bin:$NPM_PACKAGES/bin:$GOROOT/bin:$DARTSDK/bin

export PATH
