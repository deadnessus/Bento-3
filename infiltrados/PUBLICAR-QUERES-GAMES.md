# Publicar o Infiltrados na Órbita no queres.games

Este arquivo é para a sessão do Claude Code que tem o repositório do site (`deadnessus/queres-games`). Lá, use a skill **`publicar-no-queres-games`** e siga estes dados.

## Origem

- Repositório: `deadnessus/Bento-3`
- Branch: `claude/ecstatic-archimedes-rpwf8z`
- Pasta: `infiltrados/`
- Slug sugerido: `infiltrados` (abre em `https://queres.games/jogar/infiltrados/`)
- Autoria: **confirmar com o dono**. O repositório se chama Bento-3, e no site a regra é perguntar antes de pôr o nome.

## O que copiar

| De (este repositório) | Para (repositório do site) |
|---|---|
| `infiltrados/site/index.html` e `infiltrados/site/fonts/` | `public/jogar/infiltrados/` |
| `infiltrados/servidor/worker-infiltrados/` (pasta inteira) | `worker-infiltrados/` (na raiz, como `worker-furia/`) |
| `infiltrados/capa/infiltrados.webp` (800×450) | `public/capas/infiltrados.webp` |

- **Não copie** `game.html`, `index.html` da raiz da pasta, `build.sh`, `build-site.sh`, `fontes/` nem o README: são a fonte e a versão do Claude.
- A pasta `site/` é **gerada**. Se o jogo mudar, rode `./build-site.sh` dentro de `infiltrados/` antes de copiar.

## Card sugerido (`src/content/jogos/infiltrados.md`)

```
---
titulo: "Infiltrados na Órbita"
descricao: "Tripulantes fazem tarefas numa estação espacial enquanto infiltrados tentam eliminar todo mundo. Achou um corpo? Chame uma reunião e votem. Até 16 numa sala por código, com robôs para completar, loja de roupas e treino sozinho."
status: jogavel
autores: [bento]   # confirmar com o dono
ordem: 11
capa: /capas/infiltrados.webp
cores: ['#060914', '#ff4b5c']
url: /jogar/infiltrados/
---
```

## O servidor online

- **Onde está o passo a passo:** em `worker-infiltrados/LEIA-ME.md`. É o mesmo processo do Fúria: projeto `infiltrados-online` e diretório raiz `worker-infiltrados`. O deploy é separado do site e é o dono quem faz, no Cloudflare.
- **Antes do deploy:** sem o servidor, o jogo funciona no site **só no treino com robôs**. Criar ou entrar em sala mostra "Não consegui conectar".
- **Para conferir:** depois do deploy, `https://queres.games/online/infiltrados/saude` precisa mostrar `{"ok":true,"banco":true}`.

## Já conferido nesta versão

**Verificador do queres.games:** `verificar-jogo.mjs` na pasta `site/` deu **0 erros, 0 avisos, 0 dicas**.

**Regras do site:**
- **Sem chat:** no site não existe campo para escrever. As falas dos robôs são códigos que viram frases prontas.
- **Nome:** é o apelido da conta (`/conta.js?v=2`). Não existe campo de nome no site.
- **Pela rede só passam números:** o servidor descarta qualquer texto.
- **Tudo guardado no jogo:** nada vem de outro site. As fontes Chakra Petch e Nunito (licença OFL) estão em `fonts/`.
- **Som:** só toca depois de um toque e pausa quando a aba fica escondida.
- **Créditos e roupas da loja:** ficam só no aparelho (`localStorage`, chave `inf_wallet`).

**Teste local completo:** Worker rodando com `wrangler dev`, banco local com 3 contas de teste e 3 navegadores. Funcionaram:
- criar a sala e entrar pelo código;
- nomes iguais aos apelidos;
- mesmos papéis em todos os aparelhos;
- reunião, votos e ejeção;
- troca de anfitrião quando ele sai.

## Botões (para o painel de telemetria)

**Tela inicial:** `bCreate`, `bJoin`, `bSolo`, `bShop`, `bConta`.

**Refeitório:**
- regras da partida: `botPlus`, `botMinus`, `impSeg`, `kcdSeg`, `roleSeg`;
- outros botões: `bShop2`, `bStart`, `bLeave`.

**Durante a partida:** `bUse`, `bRep`, `bKill`, `bVent`, `bShift`, `bVitals`.

**Na reunião:** `bVote`, `bSkip`.

**Na loja:** `shopTabs`, `shopX`.

Nenhum evento `QG.evento` foi adicionado (só a pedido do dono).
