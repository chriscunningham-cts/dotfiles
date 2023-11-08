#! /bin/bash

set -e

cd "$(dirname "$0")"

mkdir -p "$HOME/.local/bin"

cp -rp config/* "$HOME/.config/"

cat profile >>"$HOME/.profile"

curl -SOL https://github.com/sharkdp/bat/releases/download/v0.24.0/bat-v0.24.0-aarch64-unknown-linux-gnu.tar.gz &&
  tar zxf bat-v0.24.0-aarch64-unknown-linux-gnu.tar.gz &&
  install bat-v0.24.0-aarch64-unknown-linux-gnu/bat "$HOME/.local/bin/" &&
  rm -rf bat-v0.24.0-aarch64-unknown-linux-gnu* bat
