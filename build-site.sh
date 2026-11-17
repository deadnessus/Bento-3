#!/bin/sh
# Gera site/ (cópia para o queres.games): página completa, fonte guardada no próprio site, sem Google Fonts.
set -e
rm -rf site && mkdir -p site/fonts
cp fonts/*.woff2 fonts/fonts.css fonts/OFL-Outfit.txt site/fonts/
{ printf '<!doctype html>\n<html lang="pt-BR"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover,user-scalable=no">\n'
  grep -v 'fonts.googleapis.com\|fonts.gstatic.com' game.html | sed 's#<meta name="claude:viewport-fit-sides" content="cover">#<link rel="stylesheet" href="fonts/fonts.css">#'
  printf '\n</html>\n'; } > site/index.html
