# Infiltrados na Órbita

Jogo de dedução social em HTML5 Canvas, sem dependências. Tripulantes fazem tarefas pela Estação Orbital Tucano; infiltrados eliminam a tripulação em segredo. Corpos encontrados e o alarme do refeitório abrem reuniões com chat e votação.

- **Criar sala** gera um código de 4 letras; os amigos entram digitando o código (ou tocando na sala na lista de salas abertas).
- O anfitrião escolhe robôs, número de infiltrados e tempo de recarga, e inicia a partida.
- 10 salas, 34 pontos de tarefa e 13 tipos de minijogo (fios, código no teclado, calibragem, download, lixo, escaneamento, antena, tanque, filtro, sequência, números, asteroides, disjuntores), 7 tarefas por jogador, tubulações, campo de visão com sombras, fantasmas.
- **Tipos de infiltrado:** Víbora (não deixa corpo), Metamorfo (se disfarça de outro jogador por 20 s), Oráculo (vê o tipo de todos).
- **Tipos de tripulante:** Engenheiro (usa tubulações), Cientista (sinais vitais), Detetive (descobre o tipo do assassino nas reuniões com corpo). O anfitrião pode desligar os tipos.
- **Loja:** vitória = 100 créditos + 5 por tarefa ou 20 por eliminação (metade no treino). 10 chapéus, 6 roupas e 5 olhos. A carteira fica salva no navegador.
- **Treinar com robôs** funciona offline, contra 5 robôs.

O modo online usa a capacidade `room` dos Artifacts do Claude (só funciona pelo link publicado). Toda a partida é sincronizada pela presença dos jogadores: o anfitrião (menor id na sala) simula os robôs e as regras; se ele sair, outro jogador assume.

Controles: WASD/setas, E usa, R reporta, Q elimina, V tubulação. No celular, arraste no lado esquerdo da tela.

`game.html` é a fonte; rode `./build.sh` para gerar `index.html`.
