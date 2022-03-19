#!/bin/bash
set -e

FONT_ZIP=Open_Sans.zip
FONT_URL=https://fonts.google.com/specimen/Open+Sans

# one-time preparation
if [ ! -f "${FONT_ZIP}" ]; then
    printf "${FONT_ZIP} not found, please download it from ${FONT_URL} (\"Download family\" button) and restart this script.\n"
    exit 1
fi
unzip -o -d ~/.fonts/ "${FONT_ZIP}"
luaotfload-tool --update

# compilation
rm -f fonts.pdf
lualatex fonts.tex

# open result
xdg-open fonts.pdf