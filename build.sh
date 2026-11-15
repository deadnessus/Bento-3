#!/bin/sh
# Gera index.html (página completa) a partir de game.html
{ printf '<!doctype html>\n<html lang="pt-BR"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover,user-scalable=no">\n'; cat game.html; printf '\n</html>\n'; } > index.html
