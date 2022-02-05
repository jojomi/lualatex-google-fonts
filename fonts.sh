#!/bin/sh
set -ex

# one-time preparation
unzip -o -d ~/.fonts/ Open_Sans.zip
luaotfload-tool --update

# compilation
lualatex fonts.tex

# open result
xdg-open fonts.pdf