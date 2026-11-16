#!/bin/sh
# Gera a versão do queres.games em site/ (index.html + fonts/) a partir de game.html.
# Diferenças: fontes guardadas no jogo (sem Google Fonts), conta do site (/conta.js), modo site ligado
# (sem chat, apelido da conta, online pelo servidor /online/infiltrados).
cd "$(dirname "$0")"
rm -rf site && mkdir -p site/fonts
cp fontes/*.woff2 fontes/fonts.css fontes/LICENCA-*.txt site/fonts/
python3 - <<'PY'
src = open('game.html', encoding='utf-8').read()
ini = src.index('<link rel="preconnect" href="https://fonts.googleapis.com">')
fim = src.index('display=swap">', ini) + len('display=swap">')
src = src[:ini] + '<link rel="stylesheet" href="fonts/fonts.css">' + src[fim:]
src = src.replace('<script>\n\'use strict\';', '<script src="/conta.js?v=2"></script>\n<script>window.QG_SITE=true;</script>\n<script>\n\'use strict\';', 1)
import re
src, n = re.subn(r'\n\s*<form id="chatForm".*?</form>', '', src, count=1, flags=re.S)
assert n == 1  # no site não existe campo para escrever mensagens
assert 'googleapis' not in src and 'QG_SITE=true' in src
cab = ('<!doctype html>\n<html lang="pt-BR"><head><meta charset="utf-8">\n'
       '<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover, user-scalable=no">\n')
open('site/index.html', 'w', encoding='utf-8').write(cab + src + '\n</html>\n')
PY
echo "site/ gerado"
