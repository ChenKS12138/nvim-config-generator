#!/usr/bin/env bash

set -xe

ROOT_DIR=$(readlink -f "$(dirname $0)")
DST_DIR=~/.config/nvim

if [ -d "$DST_DIR" ]; then
  echo "Already Exist"
  exit 1
else
  echo "Not Exists, try to symbol link"
fi

rm -rf "$DST_DIR"

rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim


ln -s "$ROOT_DIR" "$DST_DIR"
