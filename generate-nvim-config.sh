#!/usr/bin/env bash

#
# Script Name: generate-nvim-config.sh
#
# Author: ChenKS12138
# Email: ChenKS12138@gmail.com
# Date: March 3, 2024
#
# Description: generate nvim config based on NvChad.

# 1. Enable debug and exit at non-zero code 
set -xe

# 2. Essential variable
script_dir=$(readlink -f "$(dirname $0)")
tmp_nvchad_dir=/tmp/NvChad
nvim_config_dir=~/.config/nvim

# 3. Retrieve NvChad
rm -rf $tmp_nvchad_dir
git clone https://github.com/NvChad/NvChad $tmp_nvchad_dir --depth 1 --branch v2.0
rm -rf "$tmp_nvchad_dir/.git"

# 4. Clean up current nvim configuration
rm -rf $nvim_config_dir
rm -rf ~/.local/share/nvim
mv $tmp_nvchad_dir $nvim_config_dir

# 5. Symbol link custom config
ln -s "$script_dir/custom" "$nvim_config_dir/lua/custom"
