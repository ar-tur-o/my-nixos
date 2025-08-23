#!/bin/sh

set -e
scriptDir=$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")

pushd "$scriptDir/.."

git add .
name=${1:-$(hostname)}
sudo nixos-rebuild switch --show-trace --flake ./#$name 
echo "The following files were changed:"
git status --short

# only format if successfully built
#nix fmt ## fmt is broken and takes forever to format. For now no, formating
git add .
popd
